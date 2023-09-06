import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/firebase_auth/firebase_auth_service.dart';

final firebaseAuthInstanceProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final firebaseAuthUserChangesStreamProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthInstanceProvider).userChanges();
});

final firebaseAuthStateChangesStreamProvider = StreamProvider<User?>((ref) {
  return ref.watch(firebaseAuthInstanceProvider).authStateChanges();
});

final firebaseAuthCurrentUserProvider = Provider<User?>((ref) {
  return ref.watch(firebaseAuthUserChangesStreamProvider).value;
});

final firebaseAuthServiceProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService(ref.watch(firebaseAuthInstanceProvider));
});
