// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$queriedSearchHash() => r'af6f580e715b72825b410bf2784eb6d95d3e1ff3';

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

typedef QueriedSearchRef = AutoDisposeFutureProviderRef<List<AlbumOrArtist>>;

/// See also [queriedSearch].
@ProviderFor(queriedSearch)
const queriedSearchProvider = QueriedSearchFamily();

/// See also [queriedSearch].
class QueriedSearchFamily extends Family<AsyncValue<List<AlbumOrArtist>>> {
  /// See also [queriedSearch].
  const QueriedSearchFamily();

  /// See also [queriedSearch].
  QueriedSearchProvider call({
    int artistLimit = 3,
    int albumLimit = 7,
  }) {
    return QueriedSearchProvider(
      artistLimit: artistLimit,
      albumLimit: albumLimit,
    );
  }

  @override
  QueriedSearchProvider getProviderOverride(
    covariant QueriedSearchProvider provider,
  ) {
    return call(
      artistLimit: provider.artistLimit,
      albumLimit: provider.albumLimit,
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
  String? get name => r'queriedSearchProvider';
}

/// See also [queriedSearch].
class QueriedSearchProvider
    extends AutoDisposeFutureProvider<List<AlbumOrArtist>> {
  /// See also [queriedSearch].
  QueriedSearchProvider({
    this.artistLimit = 3,
    this.albumLimit = 7,
  }) : super.internal(
          (ref) => queriedSearch(
            ref,
            artistLimit: artistLimit,
            albumLimit: albumLimit,
          ),
          from: queriedSearchProvider,
          name: r'queriedSearchProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$queriedSearchHash,
          dependencies: QueriedSearchFamily._dependencies,
          allTransitiveDependencies:
              QueriedSearchFamily._allTransitiveDependencies,
        );

  final int artistLimit;
  final int albumLimit;

  @override
  bool operator ==(Object other) {
    return other is QueriedSearchProvider &&
        other.artistLimit == artistLimit &&
        other.albumLimit == albumLimit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artistLimit.hashCode);
    hash = _SystemHash.combine(hash, albumLimit.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$artistSelectionHash() => r'c497551dc8b8a4cadffd51013ace49d44b2ff290';

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
String _$albumSelectionHash() => r'be49eca7c90b8492ae659b83ccb2c5ac1432b56a';

/// See also [albumSelection].
@ProviderFor(albumSelection)
final albumSelectionProvider = AutoDisposeFutureProvider<Album?>.internal(
  albumSelection,
  name: r'albumSelectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$albumSelectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AlbumSelectionRef = AutoDisposeFutureProviderRef<Album?>;
String _$getTrackDataHash() => r'c04e580f03b20a229dedc50aaf0dc40928506b23';

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
String _$albumRatingCollectionStreamHash() =>
    r'f0b25a3ac2e25401a8f6977f210564cb83d2642e';

/// See also [albumRatingCollectionStream].
@ProviderFor(albumRatingCollectionStream)
final albumRatingCollectionStreamProvider =
    AutoDisposeStreamProvider<List<AlbumRating>>.internal(
  albumRatingCollectionStream,
  name: r'albumRatingCollectionStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$albumRatingCollectionStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AlbumRatingCollectionStreamRef
    = AutoDisposeStreamProviderRef<List<AlbumRating>>;
String _$currUserNameFutureHash() =>
    r'3a58905f009841c828b18414d40468b40f7869ae';

/// See also [currUserNameFuture].
@ProviderFor(currUserNameFuture)
final currUserNameFutureProvider = AutoDisposeFutureProvider<String>.internal(
  currUserNameFuture,
  name: r'currUserNameFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currUserNameFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrUserNameFutureRef = AutoDisposeFutureProviderRef<String>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
