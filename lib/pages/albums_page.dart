import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/widgets/album_tile.dart';
import '../providers/musicbrainz_providers.dart';

class AlbumsPage extends HookConsumerWidget {
  const AlbumsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue albumList = ref.watch(releaseGroupListProvider);

    return albumList.when(
      data: (albumList) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              childAspectRatio: 1,
              crossAxisSpacing: 7.5,
              mainAxisSpacing: 7.5,
            ),
            itemCount: albumList.length,
            itemBuilder: (BuildContext ctx, index) {
              // AlbumImageModel albumImageModel = jsonDecode(albumList[index]);
              return const AlbumTile(
                  imageUrl:
                      'http://coverartarchive.org/release/f268b8bc-2768-426b-901b-c7966e76de29/12750224075-250.jpg');
              // return const AlbumTile(
              //     imageUrl:
              //         'http://coverartarchive.org/release/f268b8bc-2768-426b-901b-c7966e76de29/12750224075-250.jpg');
            },
          ),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err and some balls'),
    );
  }
}
