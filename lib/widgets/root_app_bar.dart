import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/providers/firebase_auth_providers.dart';

import '../providers/misc_providers.dart';

class RootNavAppBar extends ConsumerWidget implements PreferredSizeWidget {
  // final Color backgroundColor = Colors.red;
  final Text title;
  final AppBar appBar;
  final WidgetRef ref;
  final Widget? leading;

  /// you can add more fields that meet your needs

  const RootNavAppBar({
    super.key,
    required this.title,
    required this.appBar,
    required this.ref,
    this.leading,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(firebaseAuthCurrentUserProvider);
    return AppBar(
      foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Column(
        children: [
          GestureDetector(
              child: title,
              onTap: () {
                ref.watch(stateNotifierTheme.notifier).changeBool();
              }),
          const SizedBox(height: 12.5)
        ],
      ),
      leading: leading,
      actions: userData == null
          ? null
          : [
              IconButton(
                  onPressed: () {
                    ref.read(stateNotifierAppBar.notifier).changeBool();
                    context.push('/search_page');
                  },
                  icon: const Icon(Icons.search))
            ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
