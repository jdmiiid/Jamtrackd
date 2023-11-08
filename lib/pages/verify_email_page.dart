import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/firebase_auth_providers.dart';

import 'feed_page.dart';

class VerifyEmailPage extends ConsumerWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? registeredUser = ref.watch(firebaseAuthCurrentUserProvider);
    if (registeredUser == null) {
      return const Center(child: Text('The user is null'));
    }

    if (ref.watch(firebaseAuthCurrentUserProvider)!.emailVerified) {
      return const FeedPage();
    } else {
      Future.delayed(
          const Duration(seconds: 20), () => registeredUser.reload());
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AutoSizeText(
                'A verification email has been sent to your inbox.',
                textAlign: TextAlign.center,
                minFontSize: 20,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(45)),
                onPressed: () {
                  // newUser.sendEmailVerification();
                  registeredUser.delete();
                  ref.read(firebaseAuthServiceProvider).signOut();
                },
                icon: const Icon(
                  Icons.email,
                  size: 32,
                ),
                label: const AutoSizeText(
                  'Resend Email',
                  minFontSize: 24,
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
