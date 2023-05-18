import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/widgets/album_tile.dart';
import '../models/artist.dart';
import '../models/release_group.dart';
import '../providers/musicbrainz_providers.dart';

class AlbumsPage extends HookConsumerWidget {
  AlbumsPage({super.key, required this.index, required this.query});

  late int index;
  final String query;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artistMBID = ref
        .watch(artistListProvider(query))
        .whenData((List<Artist> artistList) => artistList[index].id);

    if (artistMBID.hasValue) {
      AsyncValue releaseGroupList =
          ref.watch(releaseGroupListProvider(artistMBID.value));

      return releaseGroupList.when(
        data: (releaseGroupList) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1,
                crossAxisSpacing: 7.5,
                mainAxisSpacing: 10,
              ),
              itemCount: releaseGroupList.length,
              itemBuilder: (BuildContext ctx, index) {
                final ReleaseGroup albeezy = releaseGroupList[index];
                return AlbumTile(
                  id: albeezy.id,
                  albName: albeezy.title,
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text('Error: $err and some balls'),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
