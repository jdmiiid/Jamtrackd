import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/providers/firebase_auth_providers.dart';
import 'package:tasktrack/widgets/bottom_nav_bar.dart';
import 'package:tasktrack/widgets/root_app_bar.dart';

import '../providers/misc_providers.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: RootNavAppBar(
          title: const Text('Settings'), appBar: AppBar(), ref: ref),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () =>
                    ref.watch(stateNotifierTheme.notifier).changeBool(),
                child: const Text('Change screen mode')),
            TextButton(
              child: const Text('Sign out'),
              onPressed: () {
                ref.read(firebaseAuthServiceProvider).signOut();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
