import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/providers/firebase_firestore_providers.dart';
import 'package:tasktrack/widgets/bottom_nav_bar.dart';

import '../models/post.dart';
import '../models/special_user.dart';
import '../widgets/list_tile_item.dart';
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
                            // Wrap the ListView with NotificationListener
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
                                          padding: EdgeInsets.only(top: 8),
                                          child:
                                              Text('You reached the bottom!')));
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
                return Text('Loading ya gay cuck');
              }
            },
          ),
          bottomNavigationBar: BottomNavBar(),
        );
      },
      error: (Object error, StackTrace stackTrace) =>
          Text('Error within followingList Feedpage: $error'),
      loading: () => Center(child: CircularProgressIndicator()),
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

  Widget postItem(BuildContext context, Post post, WidgetRef ref) {
    const double paddingDouble = 8;
    final postSpecificUserObjectAsync =
        ref.watch(userInfoFromUIDProvider(post.author));

    return postSpecificUserObjectAsync.when(
        loading: () =>
            Text('loading within postspecificUserObject in postItem'),
        error: (Object error, StackTrace stackTrace) =>
            Text('error $error inside of postspecificasycn in PostItem'),
        data: (SpecialUser? postSpecificUser) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Theme.of(context).colorScheme.primary,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2, right: 2),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                post.content.title ?? 'Title',
                                maxLines: 2,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                                minFontSize: 15,
                                stepGranularity: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 4, right: 4, top: 5),
                          child: Text(
                            post.content.response.isEmpty
                                ? 'Nothing here... Boring!'
                                : post.content.response,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 7,
                          ),
                        ),
                      ),
                      Divider(
                        height: 2,
                        thickness: 2,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Flexible(
                              flex: 2,
                              child: CircleAvatar(
                                backgroundImage: postSpecificUser!
                                            .downloadURL !=
                                        null
                                    ? CachedNetworkImageProvider(
                                        postSpecificUser.downloadURL!)
                                    : const AssetImage(
                                            'assets/images/no_profile_pic.jpeg')
                                        as ImageProvider<Object>?,
                              ),
                            ),
                            Flexible(
                              flex: 3,
                              child: AutoSizeText(
                                post.username,
                                minFontSize: 10,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                VerticalDivider(
                  thickness: 1,
                  color: Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
                Expanded(
                  flex: 7,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: paddingDouble, bottom: paddingDouble),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18, right: 18),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: FittedBox(
                                    child: Text(
                                      post.content.albumName,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    '${post.content.artistName} | ${post.content.releaseDate}',
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 7,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ),
                                          child:
                                              Image.network(post.content.url),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: FittedBox(
                                    child: PostLikeButton(
                                      postLikeCount: post.likes.length,
                                      indexedPostData: post,
                                      liked: post.likes.contains(post.author),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Icon(Icons.chevron_right),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
