import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/misc_providers.dart';

class RootNavAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final Text title;
  final AppBar appBar;
  final WidgetRef ref;
  final Widget? leading;
  final List<Widget>? actions;

  const RootNavAppBar({
    super.key,
    required this.title,
    required this.appBar,
    required this.ref,
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      elevation: 3,
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Column(
        children: [
          GestureDetector(
              child: title,
              onTap: () {
                ref.watch(themeProvider.notifier).update((state) => !state);
              }),
          const SizedBox(height: 12.5)
        ],
      ),
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
