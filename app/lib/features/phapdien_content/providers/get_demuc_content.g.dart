// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_demuc_content.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDemucContentHtmlHash() =>
    r'6a17385f06dce133537680a521976865cd7ddbb3';

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

/// See also [getDemucContentHtml].
@ProviderFor(getDemucContentHtml)
const getDemucContentHtmlProvider = GetDemucContentHtmlFamily();

/// See also [getDemucContentHtml].
class GetDemucContentHtmlFamily extends Family<AsyncValue<String>> {
  /// See also [getDemucContentHtml].
  const GetDemucContentHtmlFamily();

  /// See also [getDemucContentHtml].
  GetDemucContentHtmlProvider call(
    PhapdienNode node,
  ) {
    return GetDemucContentHtmlProvider(
      node,
    );
  }

  @override
  GetDemucContentHtmlProvider getProviderOverride(
    covariant GetDemucContentHtmlProvider provider,
  ) {
    return call(
      provider.node,
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
  String? get name => r'getDemucContentHtmlProvider';
}

/// See also [getDemucContentHtml].
class GetDemucContentHtmlProvider extends AutoDisposeFutureProvider<String> {
  /// See also [getDemucContentHtml].
  GetDemucContentHtmlProvider(
    PhapdienNode node,
  ) : this._internal(
          (ref) => getDemucContentHtml(
            ref as GetDemucContentHtmlRef,
            node,
          ),
          from: getDemucContentHtmlProvider,
          name: r'getDemucContentHtmlProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDemucContentHtmlHash,
          dependencies: GetDemucContentHtmlFamily._dependencies,
          allTransitiveDependencies:
              GetDemucContentHtmlFamily._allTransitiveDependencies,
          node: node,
        );

  GetDemucContentHtmlProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.node,
  }) : super.internal();

  final PhapdienNode node;

  @override
  Override overrideWith(
    FutureOr<String> Function(GetDemucContentHtmlRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDemucContentHtmlProvider._internal(
        (ref) => create(ref as GetDemucContentHtmlRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        node: node,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _GetDemucContentHtmlProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDemucContentHtmlProvider && other.node == node;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, node.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDemucContentHtmlRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `node` of this provider.
  PhapdienNode get node;
}

class _GetDemucContentHtmlProviderElement
    extends AutoDisposeFutureProviderElement<String>
    with GetDemucContentHtmlRef {
  _GetDemucContentHtmlProviderElement(super.provider);

  @override
  PhapdienNode get node => (origin as GetDemucContentHtmlProvider).node;
}

String _$getDemucContentVbplHash() =>
    r'3cc5d1df1cc0ecf241ce5ee826981d6d4be76eb9';

/// See also [getDemucContentVbpl].
@ProviderFor(getDemucContentVbpl)
const getDemucContentVbplProvider = GetDemucContentVbplFamily();

/// See also [getDemucContentVbpl].
class GetDemucContentVbplFamily extends Family<AsyncValue<List<VBPLContent>>> {
  /// See also [getDemucContentVbpl].
  const GetDemucContentVbplFamily();

  /// See also [getDemucContentVbpl].
  GetDemucContentVbplProvider call(
    PhapdienNode node,
  ) {
    return GetDemucContentVbplProvider(
      node,
    );
  }

  @override
  GetDemucContentVbplProvider getProviderOverride(
    covariant GetDemucContentVbplProvider provider,
  ) {
    return call(
      provider.node,
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
  String? get name => r'getDemucContentVbplProvider';
}

/// See also [getDemucContentVbpl].
class GetDemucContentVbplProvider
    extends AutoDisposeFutureProvider<List<VBPLContent>> {
  /// See also [getDemucContentVbpl].
  GetDemucContentVbplProvider(
    PhapdienNode node,
  ) : this._internal(
          (ref) => getDemucContentVbpl(
            ref as GetDemucContentVbplRef,
            node,
          ),
          from: getDemucContentVbplProvider,
          name: r'getDemucContentVbplProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDemucContentVbplHash,
          dependencies: GetDemucContentVbplFamily._dependencies,
          allTransitiveDependencies:
              GetDemucContentVbplFamily._allTransitiveDependencies,
          node: node,
        );

  GetDemucContentVbplProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.node,
  }) : super.internal();

  final PhapdienNode node;

  @override
  Override overrideWith(
    FutureOr<List<VBPLContent>> Function(GetDemucContentVbplRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDemucContentVbplProvider._internal(
        (ref) => create(ref as GetDemucContentVbplRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        node: node,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<VBPLContent>> createElement() {
    return _GetDemucContentVbplProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDemucContentVbplProvider && other.node == node;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, node.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetDemucContentVbplRef
    on AutoDisposeFutureProviderRef<List<VBPLContent>> {
  /// The parameter `node` of this provider.
  PhapdienNode get node;
}

class _GetDemucContentVbplProviderElement
    extends AutoDisposeFutureProviderElement<List<VBPLContent>>
    with GetDemucContentVbplRef {
  _GetDemucContentVbplProviderElement(super.provider);

  @override
  PhapdienNode get node => (origin as GetDemucContentVbplProvider).node;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
