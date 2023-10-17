// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queriedAlbumSearchHash() =>
    r'191d0a52b57f7e080e0598ab6fabb76ed4e5adf9';

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

/// See also [queriedAlbumSearch].
@ProviderFor(queriedAlbumSearch)
const queriedAlbumSearchProvider = QueriedAlbumSearchFamily();

/// See also [queriedAlbumSearch].
class QueriedAlbumSearchFamily extends Family<AsyncValue<List<AlbumOrArtist>>> {
  /// See also [queriedAlbumSearch].
  const QueriedAlbumSearchFamily();

  /// See also [queriedAlbumSearch].
  QueriedAlbumSearchProvider call({
    int artistLimit = 3,
    int albumLimit = 7,
    bool albumsOrUsers = false,
  }) {
    return QueriedAlbumSearchProvider(
      artistLimit: artistLimit,
      albumLimit: albumLimit,
      albumsOrUsers: albumsOrUsers,
    );
  }

  @override
  QueriedAlbumSearchProvider getProviderOverride(
    covariant QueriedAlbumSearchProvider provider,
  ) {
    return call(
      artistLimit: provider.artistLimit,
      albumLimit: provider.albumLimit,
      albumsOrUsers: provider.albumsOrUsers,
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
  String? get name => r'queriedAlbumSearchProvider';
}

/// See also [queriedAlbumSearch].
class QueriedAlbumSearchProvider
    extends AutoDisposeFutureProvider<List<AlbumOrArtist>> {
  /// See also [queriedAlbumSearch].
  QueriedAlbumSearchProvider({
    int artistLimit = 3,
    int albumLimit = 7,
    bool albumsOrUsers = false,
  }) : this._internal(
          (ref) => queriedAlbumSearch(
            ref as QueriedAlbumSearchRef,
            artistLimit: artistLimit,
            albumLimit: albumLimit,
            albumsOrUsers: albumsOrUsers,
          ),
          from: queriedAlbumSearchProvider,
          name: r'queriedAlbumSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queriedAlbumSearchHash,
          dependencies: QueriedAlbumSearchFamily._dependencies,
          allTransitiveDependencies:
              QueriedAlbumSearchFamily._allTransitiveDependencies,
          artistLimit: artistLimit,
          albumLimit: albumLimit,
          albumsOrUsers: albumsOrUsers,
        );

  QueriedAlbumSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artistLimit,
    required this.albumLimit,
    required this.albumsOrUsers,
  }) : super.internal();

  final int artistLimit;
  final int albumLimit;
  final bool albumsOrUsers;

  @override
  Override overrideWith(
    FutureOr<List<AlbumOrArtist>> Function(QueriedAlbumSearchRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QueriedAlbumSearchProvider._internal(
        (ref) => create(ref as QueriedAlbumSearchRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artistLimit: artistLimit,
        albumLimit: albumLimit,
        albumsOrUsers: albumsOrUsers,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<AlbumOrArtist>> createElement() {
    return _QueriedAlbumSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QueriedAlbumSearchProvider &&
        other.artistLimit == artistLimit &&
        other.albumLimit == albumLimit &&
        other.albumsOrUsers == albumsOrUsers;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artistLimit.hashCode);
    hash = _SystemHash.combine(hash, albumLimit.hashCode);
    hash = _SystemHash.combine(hash, albumsOrUsers.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin QueriedAlbumSearchRef
    on AutoDisposeFutureProviderRef<List<AlbumOrArtist>> {
  /// The parameter `artistLimit` of this provider.
  int get artistLimit;

  /// The parameter `albumLimit` of this provider.
  int get albumLimit;

  /// The parameter `albumsOrUsers` of this provider.
  bool get albumsOrUsers;
}

class _QueriedAlbumSearchProviderElement
    extends AutoDisposeFutureProviderElement<List<AlbumOrArtist>>
    with QueriedAlbumSearchRef {
  _QueriedAlbumSearchProviderElement(super.provider);

  @override
  int get artistLimit => (origin as QueriedAlbumSearchProvider).artistLimit;
  @override
  int get albumLimit => (origin as QueriedAlbumSearchProvider).albumLimit;
  @override
  bool get albumsOrUsers =>
      (origin as QueriedAlbumSearchProvider).albumsOrUsers;
}

String _$artistSelectionHash() => r'5fbb94e617bd4399aad2966e476e35a058481e6e';

/// See also [artistSelection].
@ProviderFor(artistSelection)
final artistSelectionProvider =
    AutoDisposeFutureProvider<List<AlbumOrArtist>>.internal(
  artistSelection,
  name: r'artistSelectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$artistSelectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ArtistSelectionRef = AutoDisposeFutureProviderRef<List<AlbumOrArtist>>;
String _$getTrackDataHash() => r'3c8ead42a96ea7fd2675bced4b6cdb3f8a82adfe';

/// See also [getTrackData].
@ProviderFor(getTrackData)
final getTrackDataProvider = AutoDisposeFutureProvider<List<String>>.internal(
  getTrackData,
  name: r'getTrackDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getTrackDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetTrackDataRef = AutoDisposeFutureProviderRef<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
