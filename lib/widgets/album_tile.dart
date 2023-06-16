import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AlbumTile extends HookConsumerWidget {
  const AlbumTile(
      {super.key,
      required this.id,
      required this.albName,
      required this.artistName});

  final String albName;
  final String id;
  final String artistName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String url =
        'http://coverartarchive.org/release-group/$id/front[-250].jpg';
    return GridTile(
      footer: SizedBox(
        height: 25,
        child: GridTileBar(
          backgroundColor: const Color(0x50333333),
          title: Text(
            albName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      child: GestureDetector(
        child: Image.network(url),
        onTap: () {
          context.pushNamed('coolrankings', queryParameters: {
            'discName': albName,
            'discUrl': url,
            'discArtist': artistName,
          });
        },
      ),
    );
  }
}
