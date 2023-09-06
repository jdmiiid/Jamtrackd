import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/models/album_rating.dart';

class AlbumGridView extends ConsumerWidget {
  const AlbumGridView(this.albumDataResponse, {super.key});

  final List<AlbumRating> albumDataResponse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.4,
      ),
      itemCount: albumDataResponse.length,
      itemBuilder: (BuildContext ctx, index) {
        final AlbumRating albeezy = albumDataResponse[index];
        return GestureDetector(
          child: GridTile(
            child: Image.network(albeezy.url),
          ),
          onTap: () {
            context.push('/ratings_page');
          },
        );
      },
    );
  }
}
