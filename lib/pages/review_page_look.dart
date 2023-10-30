import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../widgets/list_tile_item.dart';
import '../models/comment.dart';
import '../models/post.dart';
import '../providers/firebase_auth_providers.dart';
import '../providers/firebase_firestore_providers.dart';
import '../widgets/root_app_bar.dart';

class ReviewPageLook extends ConsumerWidget {
  ReviewPageLook({super.key});

  bool fetched = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Post? reviewLookData = ref.watch(reviewLookProvider);
    final List<Comment> commentsList = ref.watch(stateNotifierCommentsList);

    final String userID = ref.watch(firebaseAuthCurrentUserProvider)!.uid;

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
      ref.read(stateNotifierCommentsList.notifier).fetchComments(
            initialCommentsLimit,
            ref,
            reviewLookData.postID,
            isInitial: true,
          );

      fetched = true;
    }

    if (!fetched) {
      fetchInitialData();
    }

    return Scaffold(
      appBar: RootNavAppBar(
        title: const Text('Review'),
        appBar: AppBar(),
        ref: ref,
      ),
      body: Column(
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
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              child: FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(3.5),
                                  child: Text(
                                    reviewLookData.content.rating.toString(),
                                    style: TextStyle(
                                      color: ratingColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
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
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            child: Image.network(reviewLookData.content.url),
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
                              itemBuilder: (context, index) {
                                final commentLikesAsyncList =
                                    ref.watch(fetchCommentLikesProvider(
                                  postId: reviewLookData.postID,
                                  commentId: commentsList[index].commentID,
                                ));

                                return commentLikesAsyncList.when(
                                  data: (likeList) {
                                    return CommentListTileItem(
                                        likeCount: likeList.length,
                                        indexedComment: commentsList[index],
                                        liked: likeList.contains(userID)
                                            ? true
                                            : false);
                                  },
                                  error: (Object error, StackTrace stackTrace) {
                                    return Text('error inside comment thing');
                                  },
                                  loading: () {
                                    return Text('loading inside comment thing');
                                  },
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(
                                thickness: 2,
                                height: 7,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white38,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: reviewLookData.likes.contains(userID)
                            ? const Icon(
                                Icons.favorite,
                                size: 40,
                              )
                            : const Icon(
                                Icons.favorite_border_outlined,
                                size: 40,
                              ),
                        onTap: () {
                          if (reviewLookData.likes.contains(userID)) {
                            print('delete attempt');
                            print(reviewLookData.likes);
                            deleteFirestorePostLike(
                                userId: userID, postId: reviewLookData.postID);
                          } else {
                            print('add attempt');
                            deleteFirestorePostLike(
                                userId: userID, postId: reviewLookData.postID);
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          '${reviewLookData.likes.length} Likes',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        child: Padding(
          padding: const EdgeInsets.only(top: 7),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/Maccy_Boy.jpeg'),
                      ),
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 8, right: 8, top: 5),
                          child: TextField(
                            controller: commentResponse,
                            maxLines: null,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white60,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Theme.of(context).colorScheme.surface,
                                  width: 1,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF008080),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
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
                          // await ref
                          //     .read(stateNotifierDownloadURL.notifier)
                          //     .retrieveUserImageUrl(ref, userID);
                          // final String profilePicUrl =
                          //     ref.watch(stateNotifierDownloadURL);

                          //FIX THIS

                          final newComment = Comment(
                            pPicUrl: 'www.sex.com',
                            text: commentResponse.text.trim(),
                            timestamp: DateTime.now().toString(),
                            userId: reviewLookData.author,
                            username: reviewLookData.username,
                            commentID: '',
                          );

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
