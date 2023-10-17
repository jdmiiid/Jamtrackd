import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/providers/firebase_auth_providers.dart';
import 'package:tasktrack/widgets/profile_stat_colum.dart';
import 'package:tasktrack/widgets/root_app_bar.dart';

import '../models/post.dart';
import '../models/special_user.dart';
import '../providers/firebase_firestore_providers.dart';
import '../providers/misc_providers.dart';
import 'album_grid_view.dart';
import 'bottom_nav_bar.dart';

class AsyncChainProfilePage extends ConsumerWidget {
  const AsyncChainProfilePage({Key? key, required this.tappedUser})
      : super(key: key);

  final SpecialUser tappedUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<String>> oneTimeFollowingCountAsync =
        ref.watch(retrieveFollowingListByIDFutureProvider(tappedUser.userID!));
    final AsyncValue<List<String>> oneTimeFollowerCountAsync =
        ref.watch(retrieveFollowerListByIDFutureProvider(tappedUser.userID!));

    final String currentUserID =
        ref.watch(firebaseAuthCurrentUserProvider)!.uid;

    return oneTimeFollowingCountAsync.when(
      data: (oneTimeFollowingList) {
        return oneTimeFollowerCountAsync.when(
          loading: () => const Text('Loading within follower count future'),
          data: (oneTimeFollowerCount) {
            final isFollowingProvider = StateProvider<bool>(
                (ref) => oneTimeFollowerCount.contains(currentUserID));

            return ref
                .watch(postCollectionStreamProvider(
                    tappedUserID: tappedUser.userID!))
                .when(
                  data: (userRatingData) {
                    if (userRatingData.isNotEmpty) {
                      Future.microtask(() =>
                          ref.read(showSortsProvider.notifier).state = true);
                    }
                    final String bioText =
                        tappedUser.bio ?? "This is a null bio";
                    return Scaffold(
                      appBar: RootNavAppBar(
                        title: Text(tappedUser.username!),
                        appBar: AppBar(),
                        ref: ref,
                        actions: [
                          GestureDetector(
                            child: const Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: Icon(Icons.settings_outlined),
                            ),
                            onTap: () => context.go('/settings_page'),
                          )
                        ],
                      ),
                      body: userRatingData.isEmpty
                          ? buildEmptyUserData(context, tappedUser, bioText)
                          : buildAlbumGrid(
                              ref,
                              tappedUser,
                              userRatingData,
                              oneTimeFollowerCount,
                              oneTimeFollowingList,
                              bioText,
                              isFollowingProvider),
                      bottomNavigationBar: BottomNavBar(),
                    );
                  },
                  loading: () => const Text(
                      "Loading within postStreamCollectionProvider in ProfilePage"),
                  error: (error, stackTrace) => const Text(
                      "Error from within postStreamCollectionProvider in ProfilePage"),
                );
          },
          error: (error, stackTrace) =>
              const Text('Error within follower count future'),
        );
      },
      error: (error, stackTrace) =>
          const Text('Error inside following list retrieval'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}

Widget buildSortDropdown(WidgetRef ref) {
  final List<String> sorts = ['High to low', 'Low to high', 'Newest', 'Oldest'];
  return DropdownButtonHideUnderline(
    child: DropdownButton<String>(
      icon: const Icon(Icons.sort),
      items: sorts.map<DropdownMenuItem<String>>(
        (order) {
          return DropdownMenuItem<String>(
            value: order,
            child: Text(order),
          );
        },
      ).toList(),
      onChanged: (order) {
        final orderCriterionProviderNotifier =
            ref.read(orderCriterionProvider.notifier);
        final upOrDownProviderNotifier = ref.read(upOrDownProvider.notifier);

        if (order == "High to low" || order == "Low to high") {
          orderCriterionProviderNotifier.state = 'rating';
          upOrDownProviderNotifier.state = order == "High to low";
        } else {
          orderCriterionProviderNotifier.state = 'timestamp';
          upOrDownProviderNotifier.state = order == 'Newest';
        }
      },
    ),
  );
}

Widget buildEmptyUserData(
    BuildContext context, SpecialUser tappedUser, String bioText) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(milliseconds: 2));
        print('Suck');
      },
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: FittedBox(
                          child: CircleAvatar(
                            backgroundImage: tappedUser.downloadURL != null
                                ? CachedNetworkImageProvider(
                                    tappedUser.downloadURL!)
                                : const AssetImage(
                                        'assets/images/no_profile_pic.jpeg')
                                    as ImageProvider<Object>?,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Flexible(
                                flex: 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [],
                                ),
                              ),
                              Flexible(child: Placeholder())
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    tappedUser.username!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(bioText),
                ),
                const Divider(
                  thickness: 2,
                  height: 20,
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ROOT SVG PIC HERE
                      Text(
                        "There's nothing here.",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: GestureDetector(
                          child: Text(
                            'Add your first review!',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onTap: () {
                            context.push('/search_page');
                            DefaultTabController.of(context).animateTo(0);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget buildAlbumGrid(
    WidgetRef ref,
    SpecialUser tappedUser,
    List<Post> userRatingData,
    List<String> oneTimeFollowerCount,
    List<String> oneTimeFollowingList,
    String bioText,
    StateProvider<bool> isFollowing) {
  final bool showSorts = ref.watch(showSortsProvider);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: tappedUser.downloadURL != null
                            ? CachedNetworkImageProvider(
                                tappedUser.downloadURL!)
                            : const AssetImage(
                                    'assets/images/no_profile_pic.jpeg')
                                as ImageProvider<Object>?,
                        radius: 50,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.red)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      StatelessProfileStatColumn(
                                          itemCount: userRatingData.length,
                                          labelText: 'Reviews'),
                                      StatelessFollowerColumn(
                                        itemCount: oneTimeFollowerCount.length,
                                        isCurrentUser: tappedUser.userID ==
                                            ref
                                                .watch(
                                                    firebaseAuthCurrentUserProvider)!
                                                .uid,
                                      ),
                                      StatelessProfileStatColumn(
                                          itemCount:
                                              oneTimeFollowingList.length,
                                          labelText: 'Following'),
                                    ],
                                  ),
                                ),
                                Flexible(
                                    child: StatelessLongToggleButton(
                                  isFollowingProvider: isFollowing,
                                  tappedUserID: tappedUser.userID!,
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            tappedUser.username!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(top: 1, bottom: 5),
                          child: Text(bioText),
                        ),
                      ],
                    ),
                    if (showSorts) buildSortDropdown(ref)
                  ],
                ),
                const Divider(
                  thickness: 2,
                  height: 3,
                ),
              ],
            ),
          )
        ];
      },
      body: AlbumGridView(userRatingData),
    ),
  );
}
