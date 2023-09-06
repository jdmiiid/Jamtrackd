import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/providers/firebase_auth_providers.dart';
import 'package:tasktrack/services/firebase_auth/firebase_storage_service.dart';
import '../models/post.dart';
import '../providers/firebase_firestore_providers.dart';
import '../providers/spotify_providers.dart';
import '../providers/theme_providers.dart';
import '../widgets/root_app_bar.dart';
import '../widgets/root_svg_picture.dart';

class FeedPage extends ConsumerWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final followingCheck = ref.watch(retrieveFollowingListProvider);
    final scrollController = ScrollController();
    final currentTheme = Theme.of(context);
    final colors = ref.watch(svgColorsProvider(currentTheme));
    final userId = ref.watch(firebaseAuthCurrentUserProvider)!.uid;
    final pPicDownloadUrl = ref.watch(stateNotifierDownloadURL);

    const int morePostsLimit = 2;
    const int initialPostsLimit = 5;

    if (ref.watch(currentUserNameProvider).isEmpty) {
      ref.watch(currUserNameFutureProvider);
    }

    if (pPicDownloadUrl.isEmpty) {
      ref
          .watch(stateNotifierDownloadURL.notifier)
          .retrieveUserImageUrl(ref, userId);
    }

    final updatedPosts = ref.watch(stateNotifierPostList);

    final bool hasMore = ref.watch(hasMorePostsProvider);

    return Scaffold(
      appBar: RootNavAppBar(
        title: const Text('Setlist'),
        appBar: AppBar(),
        ref: ref,
      ),
      body: followingCheck.when(
        data: (listOfFollowing) {
          scrollController.addListener(
            () {
              if (scrollController.position.maxScrollExtent ==
                  scrollController.offset) {
                ref.watch(stateNotifierPostList.notifier).fetchPosts(
                    listOfFollowing, morePostsLimit, ref,
                    isInitial: false);
              }
            },
          );

          if (listOfFollowing.isEmpty) {
            return emptyFeed(colors);
          } else {
            if (updatedPosts.isEmpty) {
              ref.read(stateNotifierPostList.notifier).fetchPosts(
                  listOfFollowing, initialPostsLimit, ref,
                  isInitial: true);
            }
            return RefreshIndicator(
              onRefresh: () {
                return ref.watch(stateNotifierPostList.notifier).fetchPosts(
                    listOfFollowing, morePostsLimit, ref,
                    isInitial: true);
              },
              child: ListView.separated(
                controller: scrollController,
                itemCount: updatedPosts.length + 1,
                itemBuilder: (context, index) {
                  if (index < updatedPosts.length) {
                    return GestureDetector(
                      child: postItem(context, updatedPosts[index], ref),
                      onTap: () {
                        ref.read(reviewLookProvider.notifier).state =
                            updatedPosts[index];
                        context.push('/review_look_page');
                      },
                    );
                  } else {
                    return hasMore
                        ? CircularProgressIndicator.adaptive()
                        : Center(child: Text('You scrolled to the bottom!'));
                  }
                },
                separatorBuilder: (context, index) => Divider(
                  thickness: 2,
                  color: Theme.of(context).colorScheme.primary,
                  height: 2,
                ),
              ),
            );
          }
        },
        error: (Object error, StackTrace stackTrace) => Text(error.toString()),
        loading: () => const Text('This is within following check'),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget emptyFeed(SvgColors colors) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RootSVGPicture(
            svgString: '<svg ... your SVG content ... />',
          ),
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
    final pPicDownloadUrl = ref.watch(stateNotifierDownloadURL);

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
                      padding: const EdgeInsets.only(left: 4, right: 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: AutoSizeText(
                              post.content.title ?? 'Title',
                              maxLines: 2,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                              minFontSize: 10,
                              stepGranularity: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(
                            Icons.favorite_outline_sharp,
                            color: Theme.of(context).colorScheme.onPrimary,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4, top: 5),
                    child: Text(
                      post.content.response.isEmpty
                          ? 'Nothing here... Boring!'
                          : post.content.response,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
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
                          backgroundImage: NetworkImage(pPicDownloadUrl),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: AutoSizeText(
                          post.username,
                          minFontSize: 10,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600),
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
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
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
                                    child: Image.network(post.content.url),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Text(
                                post.content.rating.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
  }
}
