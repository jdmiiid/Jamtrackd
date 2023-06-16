import 'package:flutter/material.dart';
import 'butt_nav_bar.dart';

class ScaffoldWithBottomNavBar extends StatelessWidget {
  const ScaffoldWithBottomNavBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        body: child,
        bottomNavigationBar: ButtNavBar(),
      ),
    );
  }
}
