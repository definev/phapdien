// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_phapdien_db.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$demucContentMapHash() => r'c4a3a02b0ef58d977ddda96bf89aebc17133847f';

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

/// See also [demucContentMap].
@ProviderFor(demucContentMap)
const demucContentMapProvider = DemucContentMapFamily();

/// See also [demucContentMap].
class DemucContentMapFamily extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [demucContentMap].
  const DemucContentMapFamily();

  /// See also [demucContentMap].
  DemucContentMapProvider call(
    String demucId,
  ) {
    return DemucContentMapProvider(
      demucId,
    );
  }

  @override
  DemucContentMapProvider getProviderOverride(
    covariant DemucContentMapProvider provider,
  ) {
    return call(
      provider.demucId,
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
  String? get name => r'demucContentMapProvider';
}

/// See also [demucContentMap].
class DemucContentMapProvider extends FutureProvider<Map<String, dynamic>> {
  /// See also [demucContentMap].
  DemucContentMapProvider(
    String demucId,
  ) : this._internal(
          (ref) => demucContentMap(
            ref as DemucContentMapRef,
            demucId,
          ),
          from: demucContentMapProvider,
          name: r'demucContentMapProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$demucContentMapHash,
          dependencies: DemucContentMapFamily._dependencies,
          allTransitiveDependencies:
              DemucContentMapFamily._allTransitiveDependencies,
          demucId: demucId,
        );

  DemucContentMapProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.demucId,
  }) : super.internal();

  final String demucId;

  @override
  Override overrideWith(
    FutureOr<Map<String, dynamic>> Function(DemucContentMapRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DemucContentMapProvider._internal(
        (ref) => create(ref as DemucContentMapRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        demucId: demucId,
      ),
    );
  }

  @override
  FutureProviderElement<Map<String, dynamic>> createElement() {
    return _DemucContentMapProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DemucContentMapProvider && other.demucId == demucId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, demucId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DemucContentMapRef on FutureProviderRef<Map<String, dynamic>> {
  /// The parameter `demucId` of this provider.
  String get demucId;
}

class _DemucContentMapProviderElement
    extends FutureProviderElement<Map<String, dynamic>>
    with DemucContentMapRef {
  _DemucContentMapProviderElement(super.provider);

  @override
  String get demucId => (origin as DemucContentMapProvider).demucId;
}

String _$filePhapdienDBHash() => r'9ded27ad80c8d8c3c6d31a2a4ad64d985641828c';

/// See also [filePhapdienDB].
@ProviderFor(filePhapdienDB)
final filePhapdienDBProvider = Provider<PhapdienDB>.internal(
  filePhapdienDB,
  name: r'filePhapdienDBProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filePhapdienDBHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FilePhapdienDBRef = ProviderRef<PhapdienDB>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
