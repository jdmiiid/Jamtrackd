import 'package:Jamtrackd/widgets/root_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/firebase_auth_providers.dart';

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
                      ref.watch(firebaseAuthServiceProvider).signOut(),
                  child: const Text('Sign out')),
              TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).colorScheme.errorContainer),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              'Please enter your login credentials to confirm deletion'),
                          content: SizedBox(
                            //Take mediaquery here to allow for
                            //column to space between
                            height: MediaQuery.of(context).size.height * .2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('This change cannot be undone.'),
                                TextFormField(
                                  decoration: InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    hintText: "Email",
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    filled: true,
                                    hintText: "Password",
                                  ),
                                )
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: Text('Cancel',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground)),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                textStyle:
                                    Theme.of(context).textTheme.labelLarge,
                              ),
                              child: const Text(
                                'Delete',
                              ),
                              onPressed: () {
                                //reathenticate with credential then delete the user
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ));
  }
}
