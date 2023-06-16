import 'package:flutter/material.dart';
import 'package:tasktrack/pages/paintings_page.dart';
import '../pages/feed_page.dart';

class SeeTabBar extends StatelessWidget {
  const SeeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: [
      PaintingsPage(),
      FeedPage(),
      PaintingsPage(),
    ]);
  }
}
