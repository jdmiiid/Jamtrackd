import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/models/album_or_artist.dart';
import 'package:tasktrack/providers/spotify_providers.dart';

class MyCircleAvatar extends ConsumerWidget {
  const MyCircleAvatar(this.suggestions, this.index, {super.key});

  final int index;
  final List<AlbumOrArtist> suggestions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currSuggObj = suggestions[index];
    final currentImageObj = currSuggObj.images;
    final currentImage = currentImageObj!.isEmpty
        ? const AssetImage('assets/images/Maccy_Boy.jpeg') as ImageProvider
        : NetworkImage(currentImageObj.last['url']);
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: currentImage,
            minRadius: 40,
          ),
          const SizedBox(height: 3),
          Text(
            currSuggObj.name,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      onTap: () {
        ref.read(artistIdProvider.notifier).state = currSuggObj.id;
        context.push('/albums_search');
      },
    );
  }
}
