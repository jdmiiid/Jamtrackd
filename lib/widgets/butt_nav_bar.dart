import 'package:flutter/material.dart';

class ButtNavBar extends StatelessWidget {
  const ButtNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Color(0xffd07746),
      child: SafeArea(
        child: TabBar(
            padding: EdgeInsets.only(top: 5),
            tabs: [
              Tab(icon: Icon(Icons.album)),
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.person))
            ],
            indicatorColor: Colors.white,
            // labelColor: Color(0xffe99e57),
            unselectedLabelColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label),
      ),
    );
  }
}
