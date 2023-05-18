import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/widgets/app_bar.dart';
import 'package:tasktrack/widgets/butt_nav_bar.dart';
import 'package:tasktrack/widgets/see_tab_bar.dart';

import 'widgets/art_searcher.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Taste App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final Color secondaryColor = const Color(0xffd07746);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromRadius(32), child: MyAppBar()),
        body: Column(
          children: [
            Flexible(
              child: SeeTabBar(),
            ),
          ],
        ),
        backgroundColor: const Color(0xff333333),
        bottomNavigationBar: const ButtNavBar(),
      ),
    );
  }
}
