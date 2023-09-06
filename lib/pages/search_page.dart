import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/widgets/art_searcher.dart';
import 'package:tasktrack/widgets/bottom_nav_bar.dart';

import '../widgets/artist_suggestions.dart';

class SearchPage extends HookConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [ArtSearcher(), const Expanded(child: ArtistModList())],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
