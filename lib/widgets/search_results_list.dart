import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/firebase_firestore_providers.dart';
import '../providers/misc_providers.dart';
import '../widgets/circle_avatar.dart';
import '../widgets/toggle_buttons.dart';
import '../models/album_or_artist.dart';

import '../models/special_user_data.dart';
import '../providers/spotify_providers.dart';

class SearchResultsList extends HookConsumerWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAlbums = ref.watch(selectedToggleIndexProvider);
    final userQuery = ref.watch(userSearchProvider);

    if (userQuery.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('What are you looking for, today?'),
          const SizedBox(height: 10),
          ToggleButtonsForSearch(),
        ],
      );
    }

    if (isAlbums < 1) {
      return ref.watch(queriedAlbumSearchProvider(albumLimit: 10)).when(
          data: (suggestions) {
            final List<AlbumOrArtist> albumList = suggestions.skip(3).toList();

            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //use intrinsicheight on these if you want picture
                        //centered
                        Expanded(child: MyCircleAvatar(suggestions, 0)),
                        Expanded(child: MyCircleAvatar(suggestions, 1)),
                        Expanded(child: MyCircleAvatar(suggestions, 2)),
                      ],
                    ),
                    const Divider(
                      thickness: 5,
                    ),
                    Expanded(
                      flex: 20,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: albumList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: SizedBox(
                                        height: 60,
                                        width: 60,
                                        child: Image(
                                            image: NetworkImage(
                                          albumList[index].images!.last['url'],
                                        )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        albumList[index].name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              ref.read(albumDataProvider.notifier).state =
                                  albumList[index];
                              context.push('/ratings_page');
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            height: 5,
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stacktrace) => Text('your error is $error'));
    } else {
      return ref.watch(queriedUserSearchProvider(userLimit: 2)).when(
          loading: () => Text('Loading withing queriedUserSearch'),
          error: (Object error, StackTrace stackTrace) =>
              Text('error: $error within queriedUserSearch'),
          data: (List<SpecialUserData?> userList) {
            return ListView.separated(
                padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                itemBuilder: (BuildContext context, int index) {
                  final user = userList[index];
                  return GestureDetector(
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 27,
                            backgroundImage: user!.photoURL != null
                                ? CachedNetworkImageProvider(user.photoURL!)
                                : const AssetImage(
                                        'assets/images/no_profile_pic.jpeg')
                                    as ImageProvider<Object>?,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.username!,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(user.displayName ?? 'Null here')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      ref.read(tappedUserDataProvider.notifier).state = user;
                      context.push('/profile_page');
                    },
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: userList.length);
          });
    }
  }
}
