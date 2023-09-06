// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_firestore_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$retrieveFollowingListHash() =>
    r'6ba0c08708d6513bd7e5d555670286872ddcd984';

/// See also [retrieveFollowingList].
@ProviderFor(retrieveFollowingList)
final retrieveFollowingListProvider =
    AutoDisposeFutureProvider<List<String>>.internal(
  retrieveFollowingList,
  name: r'retrieveFollowingListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$retrieveFollowingListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RetrieveFollowingListRef = AutoDisposeFutureProviderRef<List<String>>;
String _$firebaseFirestoreInstanceHash() =>
    r'61f08d99be908bcf239586847028e42d3dff76f5';

/// See also [firebaseFirestoreInstance].
@ProviderFor(firebaseFirestoreInstance)
final firebaseFirestoreInstanceProvider =
    AutoDisposeProvider<FirebaseFirestore>.internal(
  firebaseFirestoreInstance,
  name: r'firebaseFirestoreInstanceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$firebaseFirestoreInstanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseFirestoreInstanceRef
    = AutoDisposeProviderRef<FirebaseFirestore>;
String _$retrieveUsernameHash() => r'c312daf6116117c94b11c06c5344a0dd77c3445c';

/// See also [retrieveUsername].
@ProviderFor(retrieveUsername)
final retrieveUsernameProvider = AutoDisposeFutureProvider<String>.internal(
  retrieveUsername,
  name: r'retrieveUsernameProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$retrieveUsernameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RetrieveUsernameRef = AutoDisposeFutureProviderRef<String>;
String _$commentLikeIntHash() => r'5fabb9d241416ed5cad685949022c98250339bb0';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef CommentLikeIntRef = AutoDisposeFutureProviderRef<int>;

/// See also [commentLikeInt].
@ProviderFor(commentLikeInt)
const commentLikeIntProvider = CommentLikeIntFamily();

/// See also [commentLikeInt].
class CommentLikeIntFamily extends Family<AsyncValue<int>> {
  /// See also [commentLikeInt].
  const CommentLikeIntFamily();

  /// See also [commentLikeInt].
  CommentLikeIntProvider call(
    String postId,
    String commentId,
  ) {
    return CommentLikeIntProvider(
      postId,
      commentId,
    );
  }

  @override
  CommentLikeIntProvider getProviderOverride(
    covariant CommentLikeIntProvider provider,
  ) {
    return call(
      provider.postId,
      provider.commentId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'commentLikeIntProvider';
}

/// See also [commentLikeInt].
class CommentLikeIntProvider extends AutoDisposeFutureProvider<int> {
  /// See also [commentLikeInt].
  CommentLikeIntProvider(
    this.postId,
    this.commentId,
  ) : super.internal(
          (ref) => commentLikeInt(
            ref,
            postId,
            commentId,
          ),
          from: commentLikeIntProvider,
          name: r'commentLikeIntProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentLikeIntHash,
          dependencies: CommentLikeIntFamily._dependencies,
          allTransitiveDependencies:
              CommentLikeIntFamily._allTransitiveDependencies,
        );

  final String postId;
  final String commentId;

  @override
  bool operator ==(Object other) {
    return other is CommentLikeIntProvider &&
        other.postId == postId &&
        other.commentId == commentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);
    hash = _SystemHash.combine(hash, commentId.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
