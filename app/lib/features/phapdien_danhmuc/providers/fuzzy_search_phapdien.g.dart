// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuzzy_search_phapdien.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fuzzySearchPhapdienHash() =>
    r'a7a721cc9c298dd76e383f7534dee61a5bbd4549';

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

/// See also [fuzzySearchPhapdien].
@ProviderFor(fuzzySearchPhapdien)
const fuzzySearchPhapdienProvider = FuzzySearchPhapdienFamily();

/// See also [fuzzySearchPhapdien].
class FuzzySearchPhapdienFamily extends Family<AsyncValue<List<PhapdienNode>>> {
  /// See also [fuzzySearchPhapdien].
  const FuzzySearchPhapdienFamily();

  /// See also [fuzzySearchPhapdien].
  FuzzySearchPhapdienProvider call(
    String query,
  ) {
    return FuzzySearchPhapdienProvider(
      query,
    );
  }

  @override
  FuzzySearchPhapdienProvider getProviderOverride(
    covariant FuzzySearchPhapdienProvider provider,
  ) {
    return call(
      provider.query,
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
  String? get name => r'fuzzySearchPhapdienProvider';
}

/// See also [fuzzySearchPhapdien].
class FuzzySearchPhapdienProvider
    extends AutoDisposeFutureProvider<List<PhapdienNode>> {
  /// See also [fuzzySearchPhapdien].
  FuzzySearchPhapdienProvider(
    String query,
  ) : this._internal(
          (ref) => fuzzySearchPhapdien(
            ref as FuzzySearchPhapdienRef,
            query,
          ),
          from: fuzzySearchPhapdienProvider,
          name: r'fuzzySearchPhapdienProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fuzzySearchPhapdienHash,
          dependencies: FuzzySearchPhapdienFamily._dependencies,
          allTransitiveDependencies:
              FuzzySearchPhapdienFamily._allTransitiveDependencies,
          query: query,
        );

  FuzzySearchPhapdienProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<PhapdienNode>> Function(FuzzySearchPhapdienRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FuzzySearchPhapdienProvider._internal(
        (ref) => create(ref as FuzzySearchPhapdienRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PhapdienNode>> createElement() {
    return _FuzzySearchPhapdienProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FuzzySearchPhapdienProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FuzzySearchPhapdienRef
    on AutoDisposeFutureProviderRef<List<PhapdienNode>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FuzzySearchPhapdienProviderElement
    extends AutoDisposeFutureProviderElement<List<PhapdienNode>>
    with FuzzySearchPhapdienRef {
  _FuzzySearchPhapdienProviderElement(super.provider);

  @override
  String get query => (origin as FuzzySearchPhapdienProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
