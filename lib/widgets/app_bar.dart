import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyAppBar extends HookConsumerWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(
        'øbiñyu',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      actions: [
        IconButton(
            onPressed: () {
              context.push('/search_page');
            },
            icon: const Icon(Icons.search))
      ],
    );
  }
}
