// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_firestore_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$retrieveFollowingListStreamHash() =>
    r'6af6602e2d65eaa7783da300af8909c31ce0d1af';

/// See also [retrieveFollowingListStream].
@ProviderFor(retrieveFollowingListStream)
final retrieveFollowingListStreamProvider =
    AutoDisposeStreamProvider<List<String>>.internal(
  retrieveFollowingListStream,
  name: r'retrieveFollowingListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$retrieveFollowingListStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RetrieveFollowingListStreamRef
    = AutoDisposeStreamProviderRef<List<String>>;
String _$specialUserDataFromUIDHash() =>
    r'b9b8cdbc99a39da594393ad10f578d1fcea1981e';

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

/// See also [specialUserDataFromUID].
@ProviderFor(specialUserDataFromUID)
const specialUserDataFromUIDProvider = SpecialUserDataFromUIDFamily();

/// See also [specialUserDataFromUID].
class SpecialUserDataFromUIDFamily
    extends Family<AsyncValue<SpecialUserData?>> {
  /// See also [specialUserDataFromUID].
  const SpecialUserDataFromUIDFamily();

  /// See also [specialUserDataFromUID].
  SpecialUserDataFromUIDProvider call(
    String? uid,
  ) {
    return SpecialUserDataFromUIDProvider(
      uid,
    );
  }

  @override
  SpecialUserDataFromUIDProvider getProviderOverride(
    covariant SpecialUserDataFromUIDProvider provider,
  ) {
    return call(
      provider.uid,
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
  String? get name => r'specialUserDataFromUIDProvider';
}

/// See also [specialUserDataFromUID].
class SpecialUserDataFromUIDProvider
    extends AutoDisposeFutureProvider<SpecialUserData?> {
  /// See also [specialUserDataFromUID].
  SpecialUserDataFromUIDProvider(
    String? uid,
  ) : this._internal(
          (ref) => specialUserDataFromUID(
            ref as SpecialUserDataFromUIDRef,
            uid,
          ),
          from: specialUserDataFromUIDProvider,
          name: r'specialUserDataFromUIDProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$specialUserDataFromUIDHash,
          dependencies: SpecialUserDataFromUIDFamily._dependencies,
          allTransitiveDependencies:
              SpecialUserDataFromUIDFamily._allTransitiveDependencies,
          uid: uid,
        );

  SpecialUserDataFromUIDProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uid,
  }) : super.internal();

  final String? uid;

  @override
  Override overrideWith(
    FutureOr<SpecialUserData?> Function(SpecialUserDataFromUIDRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SpecialUserDataFromUIDProvider._internal(
        (ref) => create(ref as SpecialUserDataFromUIDRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uid: uid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SpecialUserData?> createElement() {
    return _SpecialUserDataFromUIDProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SpecialUserDataFromUIDProvider && other.uid == uid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uid.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SpecialUserDataFromUIDRef
    on AutoDisposeFutureProviderRef<SpecialUserData?> {
  /// The parameter `uid` of this provider.
  String? get uid;
}

class _SpecialUserDataFromUIDProviderElement
    extends AutoDisposeFutureProviderElement<SpecialUserData?>
    with SpecialUserDataFromUIDRef {
  _SpecialUserDataFromUIDProviderElement(super.provider);

  @override
  String? get uid => (origin as SpecialUserDataFromUIDProvider).uid;
}

String _$queriedUserSearchHash() => r'43e4f44e3df4365f45852ca020867613ed1f663b';

/// See also [queriedUserSearch].
@ProviderFor(queriedUserSearch)
const queriedUserSearchProvider = QueriedUserSearchFamily();

/// See also [queriedUserSearch].
class QueriedUserSearchFamily
    extends Family<AsyncValue<List<SpecialUserData?>>> {
  /// See also [queriedUserSearch].
  const QueriedUserSearchFamily();

  /// See also [queriedUserSearch].
  QueriedUserSearchProvider call({
    int userLimit = 10,
  }) {
    return QueriedUserSearchProvider(
      userLimit: userLimit,
    );
  }

  @override
  QueriedUserSearchProvider getProviderOverride(
    covariant QueriedUserSearchProvider provider,
  ) {
    return call(
      userLimit: provider.userLimit,
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
  String? get name => r'queriedUserSearchProvider';
}

/// See also [queriedUserSearch].
class QueriedUserSearchProvider
    extends AutoDisposeFutureProvider<List<SpecialUserData?>> {
  /// See also [queriedUserSearch].
  QueriedUserSearchProvider({
    int userLimit = 10,
  }) : this._internal(
          (ref) => queriedUserSearch(
            ref as QueriedUserSearchRef,
            userLimit: userLimit,
          ),
          from: queriedUserSearchProvider,
          name: r'queriedUserSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queriedUserSearchHash,
          dependencies: QueriedUserSearchFamily._dependencies,
          allTransitiveDependencies:
              QueriedUserSearchFamily._allTransitiveDependencies,
          userLimit: userLimit,
        );

  QueriedUserSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userLimit,
  }) : super.internal();

  final int userLimit;

  @override
  Override overrideWith(
    FutureOr<List<SpecialUserData?>> Function(QueriedUserSearchRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QueriedUserSearchProvider._internal(
        (ref) => create(ref as QueriedUserSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userLimit: userLimit,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SpecialUserData?>> createElement() {
    return _QueriedUserSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QueriedUserSearchProvider && other.userLimit == userLimit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userLimit.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QueriedUserSearchRef
    on AutoDisposeFutureProviderRef<List<SpecialUserData?>> {
  /// The parameter `userLimit` of this provider.
  int get userLimit;
}

class _QueriedUserSearchProviderElement
    extends AutoDisposeFutureProviderElement<List<SpecialUserData?>>
    with QueriedUserSearchRef {
  _QueriedUserSearchProviderElement(super.provider);

  @override
  int get userLimit => (origin as QueriedUserSearchProvider).userLimit;
}

String _$retrieveFollowingListByIDFutureHash() =>
    r'3be596af90e7ae3ce9fececb5a01e72e426fbc0f';

/// See also [retrieveFollowingListByIDFuture].
@ProviderFor(retrieveFollowingListByIDFuture)
const retrieveFollowingListByIDFutureProvider =
    RetrieveFollowingListByIDFutureFamily();

/// See also [retrieveFollowingListByIDFuture].
class RetrieveFollowingListByIDFutureFamily
    extends Family<AsyncValue<List<String>>> {
  /// See also [retrieveFollowingListByIDFuture].
  const RetrieveFollowingListByIDFutureFamily();

  /// See also [retrieveFollowingListByIDFuture].
  RetrieveFollowingListByIDFutureProvider call(
    String tappedUserID,
  ) {
    return RetrieveFollowingListByIDFutureProvider(
      tappedUserID,
    );
  }

  @override
  RetrieveFollowingListByIDFutureProvider getProviderOverride(
    covariant RetrieveFollowingListByIDFutureProvider provider,
  ) {
    return call(
      provider.tappedUserID,
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
  String? get name => r'retrieveFollowingListByIDFutureProvider';
}

/// See also [retrieveFollowingListByIDFuture].
class RetrieveFollowingListByIDFutureProvider
    extends AutoDisposeFutureProvider<List<String>> {
  /// See also [retrieveFollowingListByIDFuture].
  RetrieveFollowingListByIDFutureProvider(
    String tappedUserID,
  ) : this._internal(
          (ref) => retrieveFollowingListByIDFuture(
            ref as RetrieveFollowingListByIDFutureRef,
            tappedUserID,
          ),
          from: retrieveFollowingListByIDFutureProvider,
          name: r'retrieveFollowingListByIDFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$retrieveFollowingListByIDFutureHash,
          dependencies: RetrieveFollowingListByIDFutureFamily._dependencies,
          allTransitiveDependencies:
              RetrieveFollowingListByIDFutureFamily._allTransitiveDependencies,
          tappedUserID: tappedUserID,
        );

  RetrieveFollowingListByIDFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tappedUserID,
  }) : super.internal();

  final String tappedUserID;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(RetrieveFollowingListByIDFutureRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RetrieveFollowingListByIDFutureProvider._internal(
        (ref) => create(ref as RetrieveFollowingListByIDFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tappedUserID: tappedUserID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _RetrieveFollowingListByIDFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RetrieveFollowingListByIDFutureProvider &&
        other.tappedUserID == tappedUserID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tappedUserID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RetrieveFollowingListByIDFutureRef
    on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `tappedUserID` of this provider.
  String get tappedUserID;
}

class _RetrieveFollowingListByIDFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with RetrieveFollowingListByIDFutureRef {
  _RetrieveFollowingListByIDFutureProviderElement(super.provider);

  @override
  String get tappedUserID =>
      (origin as RetrieveFollowingListByIDFutureProvider).tappedUserID;
}

String _$retrieveFollowerListByIDFutureHash() =>
    r'aab15997d9d67c3dd1a034b9d191c6c05002eb10';

/// See also [retrieveFollowerListByIDFuture].
@ProviderFor(retrieveFollowerListByIDFuture)
const retrieveFollowerListByIDFutureProvider =
    RetrieveFollowerListByIDFutureFamily();

/// See also [retrieveFollowerListByIDFuture].
class RetrieveFollowerListByIDFutureFamily
    extends Family<AsyncValue<List<String>>> {
  /// See also [retrieveFollowerListByIDFuture].
  const RetrieveFollowerListByIDFutureFamily();

  /// See also [retrieveFollowerListByIDFuture].
  RetrieveFollowerListByIDFutureProvider call(
    String tappedUserID,
  ) {
    return RetrieveFollowerListByIDFutureProvider(
      tappedUserID,
    );
  }

  @override
  RetrieveFollowerListByIDFutureProvider getProviderOverride(
    covariant RetrieveFollowerListByIDFutureProvider provider,
  ) {
    return call(
      provider.tappedUserID,
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
  String? get name => r'retrieveFollowerListByIDFutureProvider';
}

/// See also [retrieveFollowerListByIDFuture].
class RetrieveFollowerListByIDFutureProvider
    extends AutoDisposeFutureProvider<List<String>> {
  /// See also [retrieveFollowerListByIDFuture].
  RetrieveFollowerListByIDFutureProvider(
    String tappedUserID,
  ) : this._internal(
          (ref) => retrieveFollowerListByIDFuture(
            ref as RetrieveFollowerListByIDFutureRef,
            tappedUserID,
          ),
          from: retrieveFollowerListByIDFutureProvider,
          name: r'retrieveFollowerListByIDFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$retrieveFollowerListByIDFutureHash,
          dependencies: RetrieveFollowerListByIDFutureFamily._dependencies,
          allTransitiveDependencies:
              RetrieveFollowerListByIDFutureFamily._allTransitiveDependencies,
          tappedUserID: tappedUserID,
        );

  RetrieveFollowerListByIDFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tappedUserID,
  }) : super.internal();

  final String tappedUserID;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(RetrieveFollowerListByIDFutureRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RetrieveFollowerListByIDFutureProvider._internal(
        (ref) => create(ref as RetrieveFollowerListByIDFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tappedUserID: tappedUserID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _RetrieveFollowerListByIDFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RetrieveFollowerListByIDFutureProvider &&
        other.tappedUserID == tappedUserID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tappedUserID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RetrieveFollowerListByIDFutureRef
    on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `tappedUserID` of this provider.
  String get tappedUserID;
}

class _RetrieveFollowerListByIDFutureProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with RetrieveFollowerListByIDFutureRef {
  _RetrieveFollowerListByIDFutureProviderElement(super.provider);

  @override
  String get tappedUserID =>
      (origin as RetrieveFollowerListByIDFutureProvider).tappedUserID;
}

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
String _$fetchCommentLikesHash() => r'4cca5844bb2e1499e1996fed367d405cb0494df5';

/// See also [fetchCommentLikes].
@ProviderFor(fetchCommentLikes)
const fetchCommentLikesProvider = FetchCommentLikesFamily();

/// See also [fetchCommentLikes].
class FetchCommentLikesFamily extends Family<AsyncValue<List<String>>> {
  /// See also [fetchCommentLikes].
  const FetchCommentLikesFamily();

  /// See also [fetchCommentLikes].
  FetchCommentLikesProvider call({
    required dynamic postId,
    required dynamic commentId,
  }) {
    return FetchCommentLikesProvider(
      postId: postId,
      commentId: commentId,
    );
  }

  @override
  FetchCommentLikesProvider getProviderOverride(
    covariant FetchCommentLikesProvider provider,
  ) {
    return call(
      postId: provider.postId,
      commentId: provider.commentId,
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
  String? get name => r'fetchCommentLikesProvider';
}

/// See also [fetchCommentLikes].
class FetchCommentLikesProvider
    extends AutoDisposeFutureProvider<List<String>> {
  /// See also [fetchCommentLikes].
  FetchCommentLikesProvider({
    required dynamic postId,
    required dynamic commentId,
  }) : this._internal(
          (ref) => fetchCommentLikes(
            ref as FetchCommentLikesRef,
            postId: postId,
            commentId: commentId,
          ),
          from: fetchCommentLikesProvider,
          name: r'fetchCommentLikesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchCommentLikesHash,
          dependencies: FetchCommentLikesFamily._dependencies,
          allTransitiveDependencies:
              FetchCommentLikesFamily._allTransitiveDependencies,
          postId: postId,
          commentId: commentId,
        );

  FetchCommentLikesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
    required this.commentId,
  }) : super.internal();

  final dynamic postId;
  final dynamic commentId;

  @override
  Override overrideWith(
    FutureOr<List<String>> Function(FetchCommentLikesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchCommentLikesProvider._internal(
        (ref) => create(ref as FetchCommentLikesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
        commentId: commentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<String>> createElement() {
    return _FetchCommentLikesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchCommentLikesProvider &&
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

mixin FetchCommentLikesRef on AutoDisposeFutureProviderRef<List<String>> {
  /// The parameter `postId` of this provider.
  dynamic get postId;

  /// The parameter `commentId` of this provider.
  dynamic get commentId;
}

class _FetchCommentLikesProviderElement
    extends AutoDisposeFutureProviderElement<List<String>>
    with FetchCommentLikesRef {
  _FetchCommentLikesProviderElement(super.provider);

  @override
  dynamic get postId => (origin as FetchCommentLikesProvider).postId;
  @override
  dynamic get commentId => (origin as FetchCommentLikesProvider).commentId;
}

String _$postCollectionStreamHash() =>
    r'534f924543337551fdca89ac517ee630960baaea';

/// See also [postCollectionStream].
@ProviderFor(postCollectionStream)
const postCollectionStreamProvider = PostCollectionStreamFamily();

/// See also [postCollectionStream].
class PostCollectionStreamFamily extends Family<AsyncValue<List<Post>>> {
  /// See also [postCollectionStream].
  const PostCollectionStreamFamily();

  /// See also [postCollectionStream].
  PostCollectionStreamProvider call({
    String tappedUserID = '',
  }) {
    return PostCollectionStreamProvider(
      tappedUserID: tappedUserID,
    );
  }

  @override
  PostCollectionStreamProvider getProviderOverride(
    covariant PostCollectionStreamProvider provider,
  ) {
    return call(
      tappedUserID: provider.tappedUserID,
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
  String? get name => r'postCollectionStreamProvider';
}

/// See also [postCollectionStream].
class PostCollectionStreamProvider
    extends AutoDisposeStreamProvider<List<Post>> {
  /// See also [postCollectionStream].
  PostCollectionStreamProvider({
    String tappedUserID = '',
  }) : this._internal(
          (ref) => postCollectionStream(
            ref as PostCollectionStreamRef,
            tappedUserID: tappedUserID,
          ),
          from: postCollectionStreamProvider,
          name: r'postCollectionStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postCollectionStreamHash,
          dependencies: PostCollectionStreamFamily._dependencies,
          allTransitiveDependencies:
              PostCollectionStreamFamily._allTransitiveDependencies,
          tappedUserID: tappedUserID,
        );

  PostCollectionStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tappedUserID,
  }) : super.internal();

  final String tappedUserID;

  @override
  Override overrideWith(
    Stream<List<Post>> Function(PostCollectionStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostCollectionStreamProvider._internal(
        (ref) => create(ref as PostCollectionStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tappedUserID: tappedUserID,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Post>> createElement() {
    return _PostCollectionStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostCollectionStreamProvider &&
        other.tappedUserID == tappedUserID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tappedUserID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostCollectionStreamRef on AutoDisposeStreamProviderRef<List<Post>> {
  /// The parameter `tappedUserID` of this provider.
  String get tappedUserID;
}

class _PostCollectionStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<Post>>
    with PostCollectionStreamRef {
  _PostCollectionStreamProviderElement(super.provider);

  @override
  String get tappedUserID =>
      (origin as PostCollectionStreamProvider).tappedUserID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
