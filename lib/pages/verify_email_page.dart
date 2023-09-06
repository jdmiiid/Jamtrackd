import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tasktrack/pages/feed_page.dart';
import 'package:tasktrack/providers/firebase_auth_providers.dart';
import 'package:tasktrack/widgets/bottom_nav_bar.dart';

class VerifyEmailPage extends ConsumerWidget {
  const VerifyEmailPage({super.key});

  Future reloadUser() async {
    await FirebaseAuth.instance.currentUser!.reload();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? currentUser = ref.watch(firebaseAuthCurrentUserProvider);
    final bool isEmailVerified = currentUser!.emailVerified;
    final Timer timer = Timer.periodic(const Duration(seconds: 5),
        (_) => ref.watch(firebaseAuthCurrentUserProvider)!.reload());

    if (!isEmailVerified) {
      currentUser.sendEmailVerification();

      timer;
    }

    if (isEmailVerified) {
      timer.cancel();
      return const FeedPage();
    } else {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AutoSizeText(
                'A verification email has ben sent to your inbox.',
                textAlign: TextAlign.center,
                minFontSize: 20,
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(45)),
                onPressed: () {
                  print('sent email');
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
        bottomNavigationBar: BottomNavBar(),
      );
    }
  }
}
