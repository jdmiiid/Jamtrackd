import 'package:flutter/material.dart';
import 'package:tasktrack/pages/rand_page.dart';
import '../pages/albums_page.dart';
import '../pages/feed_page.dart';
import '../pages/films_page.dart';
import '../pages/paintings_page.dart';
import '../pages/tv_page.dart';

class SeeTabBar extends StatelessWidget {
  const SeeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      AlbumsPage(index: 0, query: 'mac demarco'),
      FeedPage(),
      FilmsPage(),
    ]);
  }
}
