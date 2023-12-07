// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_phapdien_message.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$savePhapdienMessageHash() =>
    r'56823721708e80d78eb552ec1a35f29f1d7e7048';

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

/// See also [savePhapdienMessage].
@ProviderFor(savePhapdienMessage)
const savePhapdienMessageProvider = SavePhapdienMessageFamily();

/// See also [savePhapdienMessage].
class SavePhapdienMessageFamily extends Family<AsyncValue<void>> {
  /// See also [savePhapdienMessage].
  const SavePhapdienMessageFamily();

  /// See also [savePhapdienMessage].
  SavePhapdienMessageProvider call(
    String sessionId, {
    required List<PhapdienChatMessage> messages,
  }) {
    return SavePhapdienMessageProvider(
      sessionId,
      messages: messages,
    );
  }

  @override
  SavePhapdienMessageProvider getProviderOverride(
    covariant SavePhapdienMessageProvider provider,
  ) {
    return call(
      provider.sessionId,
      messages: provider.messages,
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
  String? get name => r'savePhapdienMessageProvider';
}

/// See also [savePhapdienMessage].
class SavePhapdienMessageProvider extends AutoDisposeFutureProvider<void> {
  /// See also [savePhapdienMessage].
  SavePhapdienMessageProvider(
    String sessionId, {
    required List<PhapdienChatMessage> messages,
  }) : this._internal(
          (ref) => savePhapdienMessage(
            ref as SavePhapdienMessageRef,
            sessionId,
            messages: messages,
          ),
          from: savePhapdienMessageProvider,
          name: r'savePhapdienMessageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$savePhapdienMessageHash,
          dependencies: SavePhapdienMessageFamily._dependencies,
          allTransitiveDependencies:
              SavePhapdienMessageFamily._allTransitiveDependencies,
          sessionId: sessionId,
          messages: messages,
        );

  SavePhapdienMessageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sessionId,
    required this.messages,
  }) : super.internal();

  final String sessionId;
  final List<PhapdienChatMessage> messages;

  @override
  Override overrideWith(
    FutureOr<void> Function(SavePhapdienMessageRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SavePhapdienMessageProvider._internal(
        (ref) => create(ref as SavePhapdienMessageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sessionId: sessionId,
        messages: messages,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _SavePhapdienMessageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SavePhapdienMessageProvider &&
        other.sessionId == sessionId &&
        other.messages == messages;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sessionId.hashCode);
    hash = _SystemHash.combine(hash, messages.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SavePhapdienMessageRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `sessionId` of this provider.
  String get sessionId;

  /// The parameter `messages` of this provider.
  List<PhapdienChatMessage> get messages;
}

class _SavePhapdienMessageProviderElement
    extends AutoDisposeFutureProviderElement<void> with SavePhapdienMessageRef {
  _SavePhapdienMessageProviderElement(super.provider);

  @override
  String get sessionId => (origin as SavePhapdienMessageProvider).sessionId;
  @override
  List<PhapdienChatMessage> get messages =>
      (origin as SavePhapdienMessageProvider).messages;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
