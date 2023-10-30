import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/firebase_auth_providers.dart';

import 'feed_page.dart';

class VerifyEmailPage extends ConsumerWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(firebaseAuthUserChangesStreamProvider).when(
        data: (newUser) {
          if (newUser!.emailVerified) {
            return const FeedPage();
          } else {
            print('else statement triggered in verifyemailpage');
            //Used to be a timer, but user Future instead
            // because reload method causes a rebuild
            Future.delayed(const Duration(seconds: 20), () => newUser.reload());
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
                        newUser.delete();
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
        },
        error: (Object error, StackTrace stackTrace) =>
            Text('error withing auth changes in verify email page'),
        loading: () =>
            Center(child: Text('loading within verify email page stream')));
  }
}
