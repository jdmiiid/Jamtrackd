import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/providers/spotify_providers.dart';
import 'package:tasktrack/widgets/album_grid_view.dart';
import 'package:tasktrack/widgets/bottom_nav_bar.dart';

import '../models/album_or_artist.dart';

class AlbumsListPage extends HookConsumerWidget {
  const AlbumsListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favBool = ref.watch(stateNotifierFavorites) as bool;
    final listOfWorks = ref.watch(artistSelectionProvider);

    return listOfWorks.when(
      data: (theirAlbumList) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              theirAlbumList[0].artists![0].name,
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
        body: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            // make a CALL TO DATABASE HERE
            itemCount: theirAlbumList.length,
            itemBuilder: (BuildContext ctx, index) {
              final AlbumOrArtist albeezy = theirAlbumList[index];
              return GestureDetector(
                child: GridTile(
                  footer: Container(
                    color: Colors.black54,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 7, right: 7, top: 5, bottom: 5),
                      child: Text(albeezy.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14)),
                    ),
                  ),
                  child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(7.5)),
                      child: Image.network(albeezy.images![1]['url'])),
                ),
                onTap: () {
                  ref.read(albumIdProvider.notifier).state = albeezy.id;
                  context.push('/ratings_page');
                },
              );
            },
          ),
        ),
        bottomNavigationBar: BottomNavBar(),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text('Error: $err and some balls'),
    );
  }
}
