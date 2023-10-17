import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/post.dart';

class AlbumGridView extends ConsumerWidget {
  const AlbumGridView(this.albumDataResponse, {super.key});

  final List<Post> albumDataResponse;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.4,
      ),
      itemCount: albumDataResponse.length,
      itemBuilder: (BuildContext ctx, index) {
        final Post albeezy = albumDataResponse[index];
        return GestureDetector(
          child: GridTile(
            footer: SizedBox(
              height: 20,
              child: GridTileBar(
                backgroundColor: Colors.black54,
                leading: Text(
                  albeezy.content.rating.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            child: Image.network(albeezy.content.url),
          ),
          onTap: () {
            context.push('/ratings_page');
          },
        );
      },
    );
  }
}
