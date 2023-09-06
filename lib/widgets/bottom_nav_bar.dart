import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/misc_providers.dart';

class BottomNavBar extends ConsumerWidget {
  BottomNavBar({super.key});

  final List<String> routerTabLocations = ['albums_page', '/', 'settings_page'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool appBarBool = ref.watch(stateNotifierAppBar) as bool;
    final bool isDarkMode = ref.watch(stateNotifierTheme) as bool;

    return Container(
      color: isDarkMode
          ? Theme.of(context).colorScheme.surface
          : Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: TabBar(
            labelColor: Theme.of(context).tabBarTheme.labelColor,
            indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
            indicatorPadding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            tabs: const [
              Tab(
                icon: Icon(Icons.album),
                iconMargin: EdgeInsets.only(bottom: 0.5),
                child: Text('Ratings'),
              ),
              Tab(
                  icon: Icon(Icons.home),
                  iconMargin: EdgeInsets.only(bottom: 0),
                  child: Text('Home')),
              Tab(
                  icon: Icon(Icons.person),
                  iconMargin: EdgeInsets.only(bottom: 0.5),
                  child: Text('Profile'))
            ],
            onTap: (index) {
              if (appBarBool == false) {
                ref.read(stateNotifierAppBar.notifier).changeBool();
              }
              context.go('/${routerTabLocations[index]}');
            }),
      ),
    );
  }
}
