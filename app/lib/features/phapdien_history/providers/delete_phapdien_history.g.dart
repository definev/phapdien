// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_phapdien_history.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$deletePhapdienHistoryHash() =>
    r'b26e25e4aa26a84ec23cc5978f4cfdc8c8eabd56';

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

/// See also [deletePhapdienHistory].
@ProviderFor(deletePhapdienHistory)
const deletePhapdienHistoryProvider = DeletePhapdienHistoryFamily();

/// See also [deletePhapdienHistory].
class DeletePhapdienHistoryFamily extends Family<AsyncValue<void>> {
  /// See also [deletePhapdienHistory].
  const DeletePhapdienHistoryFamily();

  /// See also [deletePhapdienHistory].
  DeletePhapdienHistoryProvider call(
    PhapdienHistory history,
  ) {
    return DeletePhapdienHistoryProvider(
      history,
    );
  }

  @override
  DeletePhapdienHistoryProvider getProviderOverride(
    covariant DeletePhapdienHistoryProvider provider,
  ) {
    return call(
      provider.history,
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
  String? get name => r'deletePhapdienHistoryProvider';
}

/// See also [deletePhapdienHistory].
class DeletePhapdienHistoryProvider extends AutoDisposeFutureProvider<void> {
  /// See also [deletePhapdienHistory].
  DeletePhapdienHistoryProvider(
    PhapdienHistory history,
  ) : this._internal(
          (ref) => deletePhapdienHistory(
            ref as DeletePhapdienHistoryRef,
            history,
          ),
          from: deletePhapdienHistoryProvider,
          name: r'deletePhapdienHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deletePhapdienHistoryHash,
          dependencies: DeletePhapdienHistoryFamily._dependencies,
          allTransitiveDependencies:
              DeletePhapdienHistoryFamily._allTransitiveDependencies,
          history: history,
        );

  DeletePhapdienHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.history,
  }) : super.internal();

  final PhapdienHistory history;

  @override
  Override overrideWith(
    FutureOr<void> Function(DeletePhapdienHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeletePhapdienHistoryProvider._internal(
        (ref) => create(ref as DeletePhapdienHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        history: history,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _DeletePhapdienHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeletePhapdienHistoryProvider && other.history == history;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, history.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeletePhapdienHistoryRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `history` of this provider.
  PhapdienHistory get history;
}

class _DeletePhapdienHistoryProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with DeletePhapdienHistoryRef {
  _DeletePhapdienHistoryProviderElement(super.provider);

  @override
  PhapdienHistory get history =>
      (origin as DeletePhapdienHistoryProvider).history;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
