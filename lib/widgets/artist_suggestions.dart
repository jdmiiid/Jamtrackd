import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/widgets/circle_avatar.dart';
import '../models/album_or_artist.dart';
import '../providers/spotify_providers.dart';

class ArtistModList extends HookConsumerWidget {
  const ArtistModList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(queriedSearchProvider(albumLimit: 10)).when(
        data: (suggestions) {
          final List<AlbumOrArtist> albumList = suggestions.skip(3).toList();

          return suggestions.isEmpty
              ? const Center(child: Text('Search for some music you like!'))
              : Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            //use intrinsicheight on these if you want picture
                            //centered
                            IntrinsicHeight(
                                child: MyCircleAvatar(suggestions, 0)),
                            IntrinsicHeight(
                                child: MyCircleAvatar(suggestions, 1)),
                            IntrinsicHeight(
                                child: MyCircleAvatar(suggestions, 2)),
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
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Image(
                                              image: NetworkImage(
                                            albumList[index]
                                                .images!
                                                .last['url'],
                                          )),
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
  }
}
