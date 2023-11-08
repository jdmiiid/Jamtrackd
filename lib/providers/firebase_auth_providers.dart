import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/firebase_auth/firebase_auth_service.dart';

part 'firebase_auth_providers.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuthInstance(FirebaseAuthInstanceRef ref) {
  return FirebaseAuth.instance;
}

@Riverpod(keepAlive: true)
Stream<User?> firebaseAuthStateChangesStream(
    FirebaseAuthStateChangesStreamRef ref) async* {
  yield* ref.watch(firebaseAuthInstanceProvider).authStateChanges();
}

@Riverpod(keepAlive: true)
User? firebaseAuthCurrentUser(FirebaseAuthCurrentUserRef ref) {
  return ref.watch(firebaseAuthStateChangesStreamProvider).value;
}

@riverpod
FirebaseAuthService firebaseAuthService(FirebaseAuthServiceRef ref) {
  return FirebaseAuthService(ref.watch(firebaseAuthInstanceProvider));
}
