import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:tasktrack/providers/firebase_auth_providers.dart';
import 'package:tasktrack/providers/firebase_firestore_providers.dart';
import 'package:tasktrack/services/firebase_auth/firebase_storage_service.dart';
import 'package:tasktrack/widgets/root_app_bar.dart';
import '../models/comment.dart';
import '../models/post.dart';

class ReviewPageLook extends ConsumerWidget {
  ReviewPageLook({super.key});

  bool initialDataFetched = false;
  bool commentsLoading = true; // Add this flag for comments loading

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Post? reviewLookData = ref.watch(reviewLookProvider);
    final List<Comment> commentsList = ref.watch(stateNotifierCommentsList);
    final List<String> likesList = ref.watch(stateNotifierPostLikesList);
    // final String userID = ref.watch(firebaseAuthCurrentUserProvider)!.uid;

    const int initialCommentsLimit = 7;

    final TextEditingController commentResponse = TextEditingController();

    final String originalHeardDateString = reviewLookData!.timestamp;
    final DateTime originalHeardDate = DateTime.parse(originalHeardDateString);
    final String formattedHeardDate =
        DateFormat('MMM d, y').format(originalHeardDate);

    Color ratingColor;

    if (reviewLookData.content.rating < 4) {
      ratingColor = Colors.red;
    } else if (reviewLookData.content.rating > 7) {
      ratingColor = Colors.green;
    } else {
      ratingColor = Colors.yellowAccent;
    }

    void fetchInitialData() {
      if (!initialDataFetched) {
        ref.read(stateNotifierCommentsList.notifier).fetchComments(
              initialCommentsLimit,
              ref,
              reviewLookData.postID,
              isInitial: true,
            );

        ref
            .read(stateNotifierPostLikesList.notifier)
            .fetchPostLikes(reviewLookData.postID);

        initialDataFetched = true;
      }
    }

    if (!initialDataFetched) {
      fetchInitialData();
    }

    // If comments are done loading, display the content
    return Scaffold(
      appBar: RootNavAppBar(
        title: const Text('Review'),
        appBar: AppBar(),
        ref: ref,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/Maccy_Boy.jpeg'),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      reviewLookData.username,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                FittedBox(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${reviewLookData.content.albumName} ',
                                        style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        reviewLookData.content.releaseDate,
                                        style: const TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    reviewLookData.content.rating.toString(),
                                    style: TextStyle(
                                      color: ratingColor,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  child: Text(
                                    'Heard $formattedHeardDate',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 7,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                child:
                                    Image.network(reviewLookData.content.url),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: RefreshIndicator(
                    displacement: 0,
                    onRefresh: () => ref
                        .read(stateNotifierCommentsList.notifier)
                        .fetchComments(
                            initialCommentsLimit, ref, reviewLookData.postID,
                            isInitial: true),
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reviewLookData.content.response == ''
                                    ? 'This is boring and a placeholder'
                                    : reviewLookData.content.response,
                                maxLines: null,
                              ),
                              const Divider(
                                thickness: 2,
                                height: 20,
                              ),
                              Flexible(
                                child: ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: commentsList.length,
                                  itemBuilder: ((context, index) {
                                    final originalCommentDateString =
                                        commentsList[index].timestamp;
                                    final originalCommentDate = DateTime.parse(
                                        originalCommentDateString);
                                    Duration dif = DateTime.now()
                                        .difference(originalCommentDate);

                                    String timeAgo;

                                    if (dif.inDays > 364) {
                                      timeAgo =
                                          '${(dif.inDays / 365).floor()}y';
                                    } else if (dif.inDays > 6) {
                                      timeAgo = '${(dif.inDays / 7).floor()}w';
                                    } else if (dif.inHours > 23) {
                                      timeAgo = '${dif.inDays}d';
                                    } else if (dif.inHours > 0) {
                                      timeAgo = '${dif.inHours}h';
                                    } else {
                                      timeAgo = '${dif.inMinutes}m';
                                    }

                                    return ref
                                        .watch(commentLikeIntProvider(
                                            reviewLookData.postID,
                                            commentsList[index].commentID))
                                        .when(
                                            data: (likeInt) {
                                              return ref
                                                  .watch(
                                                      retrieveImageUrlProvider(
                                                          commentsList[index]
                                                              .userId))
                                                  .when(
                                                      data: (profilePic) {
                                                        return ListTile(
                                                          leading: CircleAvatar(
                                                            backgroundImage:
                                                                NetworkImage(
                                                                    profilePic),
                                                          ),
                                                          title: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              RichText(
                                                                text: TextSpan(
                                                                  recognizer: TapGestureRecognizer()
                                                                    ..onTap = () =>
                                                                        print(
                                                                            'you clicked username'),
                                                                  text: commentsList[
                                                                              index]
                                                                          .username ??
                                                                      'Username',
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          ' ${commentsList[index].text}',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  height: 4),
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    flex: 3,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Text(
                                                                            timeAgo),
                                                                        Text(
                                                                            '$likeInt likes'),
                                                                        const Text(
                                                                            'Reply'),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const Expanded(
                                                                      flex: 4,
                                                                      child:
                                                                          SizedBox()),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          trailing: const Icon(
                                                            Icons
                                                                .favorite_border_outlined,
                                                            size: 16,
                                                          ),
                                                          horizontalTitleGap: 7,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 4),
                                                          dense: true,
                                                        );
                                                      },
                                                      error: (Object error,
                                                          StackTrace
                                                              stackTrace) {
                                                        return Text(
                                                            error.toString());
                                                      },
                                                      loading: () => null);
                                            },
                                            error: (error, stacktrace) =>
                                                const Text(
                                                    'error on likeINt future'),
                                            loading: () => null);
                                  }),
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const Divider(
                                    thickness: 2,
                                    height: 7,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(15)),
              child: const Icon(Icons.favorite_border_outlined),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        child: Padding(
          padding: const EdgeInsets.only(top: 7),
          child: SafeArea(
            child: Container(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              padding: const EdgeInsets.only(left: 16, right: 8),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/Maccy_Boy.jpeg'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: TextField(
                        controller: commentResponse,
                        maxLines: null,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white60,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF008080),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                          ),
                          hintText: 'Write your comment here...',
                        ),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.send,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    onTap: () async {
                      final newComment = Comment(
                          pPicURL: null,
                          subComments: [],
                          text: commentResponse.text.trim(),
                          timestamp: DateTime.now().toString(),
                          userId: reviewLookData.author,
                          username: reviewLookData.username,
                          commentID: '');

                      await createCommentDoc(
                        postId: reviewLookData.postID,
                        newComment: newComment,
                      );

                      fetchInitialData();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
