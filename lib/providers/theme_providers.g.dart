// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$svgColorsHash() => r'cab34d0e6ed4f9463c14006a13da02e7861014d3';

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

/// See also [svgColors].
@ProviderFor(svgColors)
const svgColorsProvider = SvgColorsFamily();

/// See also [svgColors].
class SvgColorsFamily extends Family<SvgColors> {
  /// See also [svgColors].
  const SvgColorsFamily();

  /// See also [svgColors].
  SvgColorsProvider call(
    ThemeData currentTheme,
  ) {
    return SvgColorsProvider(
      currentTheme,
    );
  }

  @override
  SvgColorsProvider getProviderOverride(
    covariant SvgColorsProvider provider,
  ) {
    return call(
      provider.currentTheme,
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
  String? get name => r'svgColorsProvider';
}

/// See also [svgColors].
class SvgColorsProvider extends AutoDisposeProvider<SvgColors> {
  /// See also [svgColors].
  SvgColorsProvider(
    ThemeData currentTheme,
  ) : this._internal(
          (ref) => svgColors(
            ref as SvgColorsRef,
            currentTheme,
          ),
          from: svgColorsProvider,
          name: r'svgColorsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$svgColorsHash,
          dependencies: SvgColorsFamily._dependencies,
          allTransitiveDependencies: SvgColorsFamily._allTransitiveDependencies,
          currentTheme: currentTheme,
        );

  SvgColorsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.currentTheme,
  }) : super.internal();

  final ThemeData currentTheme;

  @override
  Override overrideWith(
    SvgColors Function(SvgColorsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SvgColorsProvider._internal(
        (ref) => create(ref as SvgColorsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        currentTheme: currentTheme,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<SvgColors> createElement() {
    return _SvgColorsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SvgColorsProvider && other.currentTheme == currentTheme;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, currentTheme.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SvgColorsRef on AutoDisposeProviderRef<SvgColors> {
  /// The parameter `currentTheme` of this provider.
  ThemeData get currentTheme;
}

class _SvgColorsProviderElement extends AutoDisposeProviderElement<SvgColors>
    with SvgColorsRef {
  _SvgColorsProviderElement(super.provider);

  @override
  ThemeData get currentTheme => (origin as SvgColorsProvider).currentTheme;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
