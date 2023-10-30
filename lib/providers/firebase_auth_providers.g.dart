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
    r'7feea1566e66cc7ef8129fa1ac095fc941a0fac8';

/// See also [firebaseAuthStateChangesStream].
@ProviderFor(firebaseAuthStateChangesStream)
final firebaseAuthStateChangesStreamProvider =
    AutoDisposeStreamProvider<User?>.internal(
  firebaseAuthStateChangesStream,
  name: r'firebaseAuthStateChangesStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthStateChangesStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthStateChangesStreamRef = AutoDisposeStreamProviderRef<User?>;
String _$firebaseAuthUserChangesStreamHash() =>
    r'8dff3ac04426f7691c83744ecde9ca45807d2bb6';

/// See also [firebaseAuthUserChangesStream].
@ProviderFor(firebaseAuthUserChangesStream)
final firebaseAuthUserChangesStreamProvider = StreamProvider<User?>.internal(
  firebaseAuthUserChangesStream,
  name: r'firebaseAuthUserChangesStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseAuthUserChangesStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthUserChangesStreamRef = StreamProviderRef<User?>;
String _$firebaseAuthCurrentUserHash() =>
    r'c750397c06349e570947790e9272bfa2a3a65b14';

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
