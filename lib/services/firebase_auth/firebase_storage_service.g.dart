// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_storage_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$retrieveUserDownloadUrlHash() =>
    r'3f19ec02cf2696c1a6b5336aa5da81c470da739a';

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

/// See also [retrieveUserDownloadUrl].
@ProviderFor(retrieveUserDownloadUrl)
const retrieveUserDownloadUrlProvider = RetrieveUserDownloadUrlFamily();

/// See also [retrieveUserDownloadUrl].
class RetrieveUserDownloadUrlFamily extends Family<AsyncValue<String?>> {
  /// See also [retrieveUserDownloadUrl].
  const RetrieveUserDownloadUrlFamily();

  /// See also [retrieveUserDownloadUrl].
  RetrieveUserDownloadUrlProvider call(
    String uniqUID,
  ) {
    return RetrieveUserDownloadUrlProvider(
      uniqUID,
    );
  }

  @override
  RetrieveUserDownloadUrlProvider getProviderOverride(
    covariant RetrieveUserDownloadUrlProvider provider,
  ) {
    return call(
      provider.uniqUID,
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
  String? get name => r'retrieveUserDownloadUrlProvider';
}

/// See also [retrieveUserDownloadUrl].
class RetrieveUserDownloadUrlProvider
    extends AutoDisposeFutureProvider<String?> {
  /// See also [retrieveUserDownloadUrl].
  RetrieveUserDownloadUrlProvider(
    String uniqUID,
  ) : this._internal(
          (ref) => retrieveUserDownloadUrl(
            ref as RetrieveUserDownloadUrlRef,
            uniqUID,
          ),
          from: retrieveUserDownloadUrlProvider,
          name: r'retrieveUserDownloadUrlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$retrieveUserDownloadUrlHash,
          dependencies: RetrieveUserDownloadUrlFamily._dependencies,
          allTransitiveDependencies:
              RetrieveUserDownloadUrlFamily._allTransitiveDependencies,
          uniqUID: uniqUID,
        );

  RetrieveUserDownloadUrlProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uniqUID,
  }) : super.internal();

  final String uniqUID;

  @override
  Override overrideWith(
    FutureOr<String?> Function(RetrieveUserDownloadUrlRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RetrieveUserDownloadUrlProvider._internal(
        (ref) => create(ref as RetrieveUserDownloadUrlRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uniqUID: uniqUID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _RetrieveUserDownloadUrlProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RetrieveUserDownloadUrlProvider && other.uniqUID == uniqUID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uniqUID.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RetrieveUserDownloadUrlRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `uniqUID` of this provider.
  String get uniqUID;
}

class _RetrieveUserDownloadUrlProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with RetrieveUserDownloadUrlRef {
  _RetrieveUserDownloadUrlProviderElement(super.provider);

  @override
  String get uniqUID => (origin as RetrieveUserDownloadUrlProvider).uniqUID;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
