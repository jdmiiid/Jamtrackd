import 'package:Jamtrackd/widgets/rating_bubble.dart';
import 'package:Jamtrackd/widgets/user_link_button.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:Jamtrackd/providers/firebase_auth_providers.dart';
import 'package:Jamtrackd/providers/firebase_firestore_providers.dart';
import 'package:Jamtrackd/providers/misc_providers.dart';

import 'package:Jamtrackd/models/special_user_data.dart';
import 'package:Jamtrackd/models/comment.dart';
import 'package:Jamtrackd/models/post.dart';

import 'package:Jamtrackd/widgets/bottom_nav_bar.dart';
import 'package:Jamtrackd/widgets/root_app_bar.dart';
import 'package:intl/intl.dart';

// THE FOLLOWING CODE is from when this was JoelFeedPage instead of JoelReviewPage

// class JoelFeedPage extends ConsumerStatefulWidget {
//   const JoelFeedPage({Key? key}) : super(key: key);

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _JoelFeedPageState();
// }

// class _JoelFeedPageState extends ConsumerState<JoelFeedPage> {
//   final ScrollController _scrollController = ScrollController();
//   final int initialPostsLimit = 3;
//   final int followUpPostsLimit = 2;

//   Future<void> fetchPostsFuture(List<String> followingList) {
//     return ref
//         .read(stateNotifierPostList.notifier)
//         .fetchInitialPosts(initialPostsLimit, ref, followingList);
//   }

//   @override
//   void initState() {
//     _scrollController.addListener(() {});
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final AsyncValue<List<String>> followingListAsync =
//         ref.watch(retrieveFollowingListStreamProvider);

//     return followingListAsync.when(
//         data: (followingList) {
//           return Scaffold(
//               appBar: RootNavAppBar(
//                   title: const Text('Jamtrackd'), appBar: AppBar(), ref: ref),
//               body: FutureBuilder(
//                   future: fetchPostsFuture(followingList),
//                   builder: (BuildContext context, snapshot) {
//                     if (snapshot.connectionState != ConnectionState.done) {
//                       return const Text('Loading');
//                     }

//                     return Consumer(builder: (context, ref, _) {
//                       final updatedPosts = ref.watch(stateNotifierPostList);

//                       if (updatedPosts.isEmpty) {
//                         return emptyFeed();
//                       }

//                       return RefreshIndicator(
//                           onRefresh: () async {
//                             await fetchPostsFuture(followingList);
//                           },
//                           child: NotificationListener<ScrollNotification>(
//                               // Wrap the ListView with NotificationListener
//                               onNotification: (notification) {
//                                 if (notification is ScrollEndNotification &&
//                                     _scrollController.position.maxScrollExtent -
//                                             _scrollController.offset ==
//                                         0) {
//                                   ref
//                                       .watch(stateNotifierPostList.notifier)
//                                       .fetchFollowUpPosts(followUpPostsLimit,
//                                           ref, followingList);
//                                 }
//                                 return false;
//                               },
//                               child: ListView.separated(
//                                   controller: _scrollController,
//                                   physics:
//                                       const AlwaysScrollableScrollPhysics(),
//                                   itemCount:
//                                       updatedPosts.length + 1, // Ask Meader
//                                   itemBuilder:
//                                       (BuildContext context, int index) {
//                                     if (index < updatedPosts.length) {
//                                       return GestureDetector(
//                                         child: postItem(
//                                             context, updatedPosts[index], ref),
//                                       );
//                                     } else {
//                                       return Center(
//                                           child: Container(
//                                               padding:
//                                                   const EdgeInsets.only(top: 8),
//                                               child: const Text(
//                                                   'You reached the bottom!')));
//                                     }
//                                   },
//                                   separatorBuilder: (context, index) => Divider(
//                                       thickness: 2,
//                                       color:
//                                           Theme.of(context).colorScheme.primary,
//                                       height: 2))));
//                     });
//                   }),
//               bottomNavigationBar: BottomNavBar());
//         },
//         error: (Object error, StackTrace stackTrace) =>
//             Text('Error within followingList Feedpage: $error'),
//         loading: () => const Center(
//             child: CircularProgressIndicator())); // followingListAsync.when()
//   }

class JoelReviewPage extends ConsumerWidget {
  const JoelReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool initialFetched = ref.watch(postFetchedProvider);

    final Post? post = ref.watch(reviewLookProvider);
    final List<Comment> commentsList = ref.watch(stateNotifierCommentsList);

    final String userID = ref.watch(firebaseAuthCurrentUserProvider)!.uid;

    const int initialCommentsLimit = 7;

    final TextEditingController commentResponse = TextEditingController();

    final String heardDate = DateFormat('MMM d, y').format(
      DateTime.parse(post!.timestamp)
    );

    void fetchInitialData() {
      ref.read(stateNotifierCommentsList.notifier).fetchComments(
        initialCommentsLimit,
        ref,
        post.postID,
        isInitial: true,
      );

      ref.read(postFetchedProvider.notifier).update((state) => true);
    }

    if (!initialFetched) {
      fetchInitialData();
    }

    return Scaffold(
      appBar: RootNavAppBar(
        title: const Text('Review'),
        appBar: AppBar(),
        ref: ref
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          reviewItem(context, post, ref)
        ],
      )
    );
  }

  Widget reviewItem(BuildContext context, Post post, WidgetRef ref) {
    const double boxHeightAdjustment = .50;
    final postSpecificUserObjectAsync =
        ref.watch(specialUserDataFromUIDProvider(post.author));

    Color ratingColor;
      if (post.content.rating < 4) {
        ratingColor = Colors.red;
      } else if (post.content.rating > 7) {
        ratingColor = Colors.green;
      } else {
        ratingColor = Colors.yellowAccent;
      }

    return postSpecificUserObjectAsync.when(
      loading: () =>
          const Text('Loading within postSpecificUserObject in postItem'),
      error: (Object error, StackTrace stackTrace) => Text(
          'Error inside postSpecificUserObjectAsync in postItem: $error'),
      data: (SpecialUserData? postSpecificUser) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                post.content.title ?? 'No Title',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35
                )
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  post.content.url,
                  fit: BoxFit.contain,
                ),
              ),
              RatingBubble(rating: post.content.rating.toString(), color: ratingColor),
              UserLinkButton(user: postSpecificUser!),
              Text(
                post.content.response,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18
                )
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite),
                  Text(
                    '|',
                    style: TextStyle(
                      fontSize: 24
                    )
                  ),
                  Icon(Icons.mode_comment)
                ]
              )
            ]
          )
        );
      }
    ); // postSpecificUserObjectAsync.when()
  }

  // Widget emptyFeed() {
  //   return Center(
  //       child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
  //     const Text(
  //       "Your feed is empty.",
  //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //     ),
  //     Row(mainAxisAlignment: MainAxisAlignment.center, children: [
  //       GestureDetector(
  //           child: const Text("Add some friends",
  //               style: TextStyle(
  //                   fontSize: 14, decoration: TextDecoration.underline))),
  //       const Text(" to see what they're reviewing!"),
  //     ])
  //   ]));
  // }
}
