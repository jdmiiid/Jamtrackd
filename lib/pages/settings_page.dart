import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/firebase_auth_providers.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
            child: TextButton(
                onPressed: () =>
                    ref.watch(firebaseAuthServiceProvider).signOut(),
                child: Text('Sign out'))));
  }
}
