import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/providers/musicbrainz_providers.dart';

class AlbumTile extends HookConsumerWidget {
  const AlbumTile({super.key, required this.id, required this.albName});

  final String albName;
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridTile(
      footer: SizedBox(
        height: 30,
        child: GridTileBar(
          backgroundColor: const Color(0x50333333),
          title: Text(
            albName,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      child: Image.network(
          'http://coverartarchive.org/release-group/$id/front[-250].jpg'),
    );
  }
}
