import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtNavBar extends StatelessWidget {
  ButtNavBar({super.key});

  final List<String> routerTabLocations = ['albums_page', '', 'feed_page'];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffd07746),
      child: SafeArea(
        child: TabBar(
          padding: const EdgeInsets.only(top: 5),
          tabs: const [
            Tab(icon: Icon(Icons.album)),
            Tab(icon: Icon(Icons.home)),
            Tab(icon: Icon(Icons.person))
          ],
          indicatorColor: Colors.white,
          unselectedLabelColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.label,
          onTap: (index) => context.go('/${routerTabLocations[index]}'),
        ),
      ),
    );
  }
}
