import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/special_user.dart';
import '../providers/firebase_auth_providers.dart';
import '../providers/firebase_firestore_providers.dart';
import '../widgets/async_chain_profile_page.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User? currentUser = ref.watch(firebaseAuthCurrentUserProvider);
    final SpecialUser? tappedUser = ref.watch(tappedUserProvider);

    if (tappedUser == null) {
      return ref.watch(userInfoFromUIDProvider(currentUser!.uid)).when(
          loading: () => Text('loading within userdatafromUID in profilepage'),
          data: (SpecialUser? currentUser) =>
              AsyncChainProfilePage(tappedUser: currentUser!),
          error: (Object error, StackTrace stackTrace) =>
              Text('error getting the currentUserData for profilePage'));
    } else {
      return AsyncChainProfilePage(tappedUser: tappedUser);
    }
  }
}
