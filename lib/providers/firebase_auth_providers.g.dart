// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAuthInstanceHash() =>
    r'be1e9738992168ad1a232b5d4c8126dca60e337d';

/// See also [firebaseAuthInstance].
@ProviderFor(firebaseAuthInstance)
final firebaseAuthInstanceProvider = Provider<FirebaseAuth>.internal(
  firebaseAuthInstance,
  name: r'firebaseAuthInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthInstanceRef = ProviderRef<FirebaseAuth>;
String _$firebaseAuthStateChangesStreamHash() =>
    r'4350749099ba366c79a597af4fcda65682b52d0f';

/// See also [firebaseAuthStateChangesStream].
@ProviderFor(firebaseAuthStateChangesStream)
final firebaseAuthStateChangesStreamProvider = StreamProvider<User?>.internal(
  firebaseAuthStateChangesStream,
  name: r'firebaseAuthStateChangesStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthStateChangesStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthStateChangesStreamRef = StreamProviderRef<User?>;
String _$firebaseAuthCurrentUserHash() =>
    r'1ae8856c154b33ffb0999990a1675a44ba0bf036';

/// See also [firebaseAuthCurrentUser].
@ProviderFor(firebaseAuthCurrentUser)
final firebaseAuthCurrentUserProvider = Provider<User?>.internal(
  firebaseAuthCurrentUser,
  name: r'firebaseAuthCurrentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthCurrentUserRef = ProviderRef<User?>;
String _$firebaseAuthServiceHash() =>
    r'a6ef572166fd5f5cfe24af1d0b973e47ac3f2404';

/// See also [firebaseAuthService].
@ProviderFor(firebaseAuthService)
final firebaseAuthServiceProvider =
    AutoDisposeProvider<FirebaseAuthService>.internal(
  firebaseAuthService,
  name: r'firebaseAuthServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthServiceRef = AutoDisposeProviderRef<FirebaseAuthService>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
