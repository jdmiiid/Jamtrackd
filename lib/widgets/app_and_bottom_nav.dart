import 'package:flutter/material.dart';
import 'butt_nav_bar.dart';

class ScaffoldWithAppAndBottomNavBar extends StatelessWidget {
  const ScaffoldWithAppAndBottomNavBar({super.key, required this.child});

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
