import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/firebase_firestore_providers.dart';
import '../widgets/bottom_nav_bar.dart';

import '../models/post.dart';

import '../widgets/root_app_bar.dart';

class FeedPage extends ConsumerStatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeedPageState();
}

class _FeedPageState extends ConsumerState<FeedPage> {
  final ScrollController _scrollController = ScrollController();
  final int initialPostsLimit = 5;
  final int followUpPostsLimit = 3;

  @override
  void initState() {
    _scrollController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<String>> followingListAsync =
        ref.watch(retrieveFollowingListStreamProvider);

    return followingListAsync.when(
      data: (followingList) {
        final fetchInitialPostsFuture = ref
            .read(stateNotifierPostList.notifier)
            .fetchInitialPosts(initialPostsLimit, ref, followingList);

        return Scaffold(
          appBar: RootNavAppBar(
            title: const Text('JamTrackd'),
            appBar: AppBar(),
            ref: ref,
          ),
          body: FutureBuilder(
            future: fetchInitialPostsFuture,
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Consumer(builder: (context, ref, _) {
                  final updatedPosts = ref.watch(stateNotifierPostList);

                  return updatedPosts.isEmpty
                      ? emptyFeed()
                      : RefreshIndicator(
                          onRefresh: () async {
                            await ref
                                .read(stateNotifierPostList.notifier)
                                .fetchInitialPosts(
                                    initialPostsLimit, ref, followingList);
                          },
                          child: NotificationListener<ScrollNotification>(
                            onNotification: (notification) {
                              if (notification is ScrollEndNotification &&
                                  _scrollController.position.maxScrollExtent -
                                          _scrollController.offset ==
                                      0) {
                                ref
                                    .watch(stateNotifierPostList.notifier)
                                    .fetchFollowUpPosts(
                                        followUpPostsLimit, ref, followingList);
                              }
                              return false;
                            },
                            child: ListView.separated(
                              controller: _scrollController,
                              physics: const AlwaysScrollableScrollPhysics(),
                              itemCount: updatedPosts.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                if (index < updatedPosts.length) {
                                  return GestureDetector(
                                    child: postItem(
                                        context, updatedPosts[index], ref),
                                    onTap: () {
                                      ref
                                          .read(reviewLookProvider.notifier)
                                          .state = updatedPosts[index];
                                      context.push('/review_look_page');
                                    },
                                  );
                                } else {
                                  return Center(
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 8),
                                      child:
                                          const Text('You reached the bottom!'),
                                    ),
                                  );
                                }
                              },
                              separatorBuilder: (context, index) => Divider(
                                thickness: 2,
                                color: Theme.of(context).colorScheme.primary,
                                height: 2,
                              ),
                            ),
                          ),
                        );
                });
              } else {
                return const Text('Loading ya gay cuck');
              }
            },
          ),
          bottomNavigationBar: BottomNavBar(),
        );
      },
      error: (Object error, StackTrace stackTrace) =>
          Text('Error within followingList Feedpage: $error'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget emptyFeed() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // RootSVGPicture(
          //   svgString: '<svg ... your SVG content ... />',
          // ),
          const Text(
            "Your feed is empty.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: const Text(
                  "Add some friends",
                  style: TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Text(" to see what they're posting"),
            ],
          ),
        ],
      ),
    );
  }
}

Widget postItem(BuildContext context, Post post, WidgetRef ref) {
  final bodyHeight = MediaQuery.of(context).size.height -
      AppBar().preferredSize.height -
      kBottomNavigationBarHeight;

  return Padding(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
    child: SizedBox(
      // postItem height is set to 1/3 of the body height
      height: bodyHeight * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        post.content.albumName,
                        minFontSize: 19,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        post.content.releaseDate,
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        post.content.response,
                        style: TextStyle(
                          fontSize: 19.5,
                        ),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12.5)),
                  child: CachedNetworkImage(
                    imageUrl: post.content.url,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 5,
                  child: Row(children: [
                    CircleAvatar(),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        post.username,
                        style: TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ]),
                ),
                Expanded(child: SizedBox()),
                Expanded(
                  flex: 4,
                  child: FittedBox(
                    child: Row(
                      children: [
                        Text('405'),
                        Icon(
                          Icons.favorite,
                          size: 12,
                        ),
                        Text(' | '),
                        Text(post.content.rating.toString()),
                        Icon(
                          Icons.star,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
