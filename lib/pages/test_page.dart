import 'package:Jamtrackd/providers/firebase_auth_providers.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
            child: TextButton(
      onPressed: () {
        final currentUser = ref.watch(firebaseAuthCurrentUserProvider);

        ref
            .read(firebaseAuthServiceProvider)
            .deleteUser(currentFirebaseUser: currentUser!);
      },
      child: const Text('Delete User'),
    )));
  }
}
