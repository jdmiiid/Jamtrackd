import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/firebase_auth_providers.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _email,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: _password,
              decoration: const InputDecoration(hintText: 'Password'),
              obscureText: true,
              autocorrect: false,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => ref
                    .watch(firebaseAuthInstanceProvider)
                    .signInWithEmailAndPassword(
                        email: _email.text.trim(),
                        password: _password.text.trim()),
                child: const Text('retrasado'))
          ],
        ),
      );
}
