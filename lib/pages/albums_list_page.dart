import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/release_group.dart';
import '../providers/musicbrainz_providers.dart';
import '../widgets/album_tile.dart';

class AlbumsListPage extends HookConsumerWidget {
  const AlbumsListPage({super.key, this.index, this.query, this.id});

  final String? index;
  final String? query;
  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favBool = ref.watch(stateNotifierFavorites) as bool;
    AsyncValue releaseGroupList = ref.watch(releaseGroupListProvider(id));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            '$query',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(stateNotifierFavorites.notifier).changeBool();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("favoriting feature coming soon!"),
                  ),
                );
              },
              icon: favBool
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border_outlined))
        ],
      ),
      body: releaseGroupList.when(
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
                  artistName: query!,
                );
              },
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Text('Error: $err and some balls'),
      ),
    );
  }
}
