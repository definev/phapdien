// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_phapdien_nodes_child.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPhapdienRootNodesHash() =>
    r'f71c22191209c2ae41393e6347e9dc37596d2d19';

/// See also [_getPhapdienRootNodes].
@ProviderFor(_getPhapdienRootNodes)
final _getPhapdienRootNodesProvider =
    FutureProvider<List<PhapdienNode>>.internal(
  _getPhapdienRootNodes,
  name: r'_getPhapdienRootNodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getPhapdienRootNodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _GetPhapdienRootNodesRef = FutureProviderRef<List<PhapdienNode>>;
String _$getPhapdienNodesChildHash() =>
    r'6b0311ad5670b196d0af509c5ae31d7d519c5b04';

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

/// See also [getPhapdienNodesChild].
@ProviderFor(getPhapdienNodesChild)
const getPhapdienNodesChildProvider = GetPhapdienNodesChildFamily();

/// See also [getPhapdienNodesChild].
class GetPhapdienNodesChildFamily
    extends Family<AsyncValue<List<PhapdienNode>>> {
  /// See also [getPhapdienNodesChild].
  const GetPhapdienNodesChildFamily();

  /// See also [getPhapdienNodesChild].
  GetPhapdienNodesChildProvider call(
    PhapdienNode? parent,
  ) {
    return GetPhapdienNodesChildProvider(
      parent,
    );
  }

  @override
  GetPhapdienNodesChildProvider getProviderOverride(
    covariant GetPhapdienNodesChildProvider provider,
  ) {
    return call(
      provider.parent,
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
  String? get name => r'getPhapdienNodesChildProvider';
}

/// See also [getPhapdienNodesChild].
class GetPhapdienNodesChildProvider extends FutureProvider<List<PhapdienNode>> {
  /// See also [getPhapdienNodesChild].
  GetPhapdienNodesChildProvider(
    PhapdienNode? parent,
  ) : this._internal(
          (ref) => getPhapdienNodesChild(
            ref as GetPhapdienNodesChildRef,
            parent,
          ),
          from: getPhapdienNodesChildProvider,
          name: r'getPhapdienNodesChildProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPhapdienNodesChildHash,
          dependencies: GetPhapdienNodesChildFamily._dependencies,
          allTransitiveDependencies:
              GetPhapdienNodesChildFamily._allTransitiveDependencies,
          parent: parent,
        );

  GetPhapdienNodesChildProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.parent,
  }) : super.internal();

  final PhapdienNode? parent;

  @override
  Override overrideWith(
    FutureOr<List<PhapdienNode>> Function(GetPhapdienNodesChildRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPhapdienNodesChildProvider._internal(
        (ref) => create(ref as GetPhapdienNodesChildRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        parent: parent,
      ),
    );
  }

  @override
  FutureProviderElement<List<PhapdienNode>> createElement() {
    return _GetPhapdienNodesChildProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPhapdienNodesChildProvider && other.parent == parent;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, parent.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPhapdienNodesChildRef on FutureProviderRef<List<PhapdienNode>> {
  /// The parameter `parent` of this provider.
  PhapdienNode? get parent;
}

class _GetPhapdienNodesChildProviderElement
    extends FutureProviderElement<List<PhapdienNode>>
    with GetPhapdienNodesChildRef {
  _GetPhapdienNodesChildProviderElement(super.provider);

  @override
  PhapdienNode? get parent => (origin as GetPhapdienNodesChildProvider).parent;
}

String _$cachedPhapdienNodesHash() =>
    r'5809cf52c65b0c624cb253efb38140fa4e481a73';

/// See also [CachedPhapdienNodes].
@ProviderFor(CachedPhapdienNodes)
final cachedPhapdienNodesProvider =
    NotifierProvider<CachedPhapdienNodes, Set<PhapdienNode>>.internal(
  CachedPhapdienNodes.new,
  name: r'cachedPhapdienNodesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cachedPhapdienNodesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CachedPhapdienNodes = Notifier<Set<PhapdienNode>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
