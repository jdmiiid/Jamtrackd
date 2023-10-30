import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/art_searcher.dart';
import '../widgets/bottom_nav_bar.dart';

import '../providers/spotify_providers.dart';
import '../widgets/search_results_list.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(spotifyTokenProvider) == '') {
      // Get initial access token
      print('Grabbing Access token!');
      getSpotifyAccessToken(ref);
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [ArtSearcher(), const Expanded(child: SearchResultsList())],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
