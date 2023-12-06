// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_phapdien_chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$openChatSessionHash() => r'0bc2bd6e7b997b05188a9cde019a0b009feaab4d';

/// See also [openChatSession].
@ProviderFor(openChatSession)
final openChatSessionProvider = AutoDisposeProvider<void>.internal(
  openChatSession,
  name: r'openChatSessionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$openChatSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OpenChatSessionRef = AutoDisposeProviderRef<void>;
String _$askPhapdienChatHash() => r'e0bae53b11d5dbb72d1e6492fd3fc36f98c11f8e';

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

/// See also [askPhapdienChat].
@ProviderFor(askPhapdienChat)
const askPhapdienChatProvider = AskPhapdienChatFamily();

/// See also [askPhapdienChat].
class AskPhapdienChatFamily extends Family<AsyncValue<PhapdienChatMessage>> {
  /// See also [askPhapdienChat].
  const AskPhapdienChatFamily();

  /// See also [askPhapdienChat].
  AskPhapdienChatProvider call(
    String question,
  ) {
    return AskPhapdienChatProvider(
      question,
    );
  }

  @override
  AskPhapdienChatProvider getProviderOverride(
    covariant AskPhapdienChatProvider provider,
  ) {
    return call(
      provider.question,
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
  String? get name => r'askPhapdienChatProvider';
}

/// See also [askPhapdienChat].
class AskPhapdienChatProvider
    extends AutoDisposeFutureProvider<PhapdienChatMessage> {
  /// See also [askPhapdienChat].
  AskPhapdienChatProvider(
    String question,
  ) : this._internal(
          (ref) => askPhapdienChat(
            ref as AskPhapdienChatRef,
            question,
          ),
          from: askPhapdienChatProvider,
          name: r'askPhapdienChatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$askPhapdienChatHash,
          dependencies: AskPhapdienChatFamily._dependencies,
          allTransitiveDependencies:
              AskPhapdienChatFamily._allTransitiveDependencies,
          question: question,
        );

  AskPhapdienChatProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.question,
  }) : super.internal();

  final String question;

  @override
  Override overrideWith(
    FutureOr<PhapdienChatMessage> Function(AskPhapdienChatRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AskPhapdienChatProvider._internal(
        (ref) => create(ref as AskPhapdienChatRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        question: question,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PhapdienChatMessage> createElement() {
    return _AskPhapdienChatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AskPhapdienChatProvider && other.question == question;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, question.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AskPhapdienChatRef on AutoDisposeFutureProviderRef<PhapdienChatMessage> {
  /// The parameter `question` of this provider.
  String get question;
}

class _AskPhapdienChatProviderElement
    extends AutoDisposeFutureProviderElement<PhapdienChatMessage>
    with AskPhapdienChatRef {
  _AskPhapdienChatProviderElement(super.provider);

  @override
  String get question => (origin as AskPhapdienChatProvider).question;
}

String _$streamAskPhapdienChatHash() =>
    r'c056d93249ee3bfa303f5677179a3ec45fb89897';

/// See also [streamAskPhapdienChat].
@ProviderFor(streamAskPhapdienChat)
const streamAskPhapdienChatProvider = StreamAskPhapdienChatFamily();

/// See also [streamAskPhapdienChat].
class StreamAskPhapdienChatFamily
    extends Family<AsyncValue<PhapdienChatMessage>> {
  /// See also [streamAskPhapdienChat].
  const StreamAskPhapdienChatFamily();

  /// See also [streamAskPhapdienChat].
  StreamAskPhapdienChatProvider call(
    String question,
  ) {
    return StreamAskPhapdienChatProvider(
      question,
    );
  }

  @override
  StreamAskPhapdienChatProvider getProviderOverride(
    covariant StreamAskPhapdienChatProvider provider,
  ) {
    return call(
      provider.question,
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
  String? get name => r'streamAskPhapdienChatProvider';
}

/// See also [streamAskPhapdienChat].
class StreamAskPhapdienChatProvider
    extends AutoDisposeStreamProvider<PhapdienChatMessage> {
  /// See also [streamAskPhapdienChat].
  StreamAskPhapdienChatProvider(
    String question,
  ) : this._internal(
          (ref) => streamAskPhapdienChat(
            ref as StreamAskPhapdienChatRef,
            question,
          ),
          from: streamAskPhapdienChatProvider,
          name: r'streamAskPhapdienChatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$streamAskPhapdienChatHash,
          dependencies: StreamAskPhapdienChatFamily._dependencies,
          allTransitiveDependencies:
              StreamAskPhapdienChatFamily._allTransitiveDependencies,
          question: question,
        );

  StreamAskPhapdienChatProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.question,
  }) : super.internal();

  final String question;

  @override
  Override overrideWith(
    Stream<PhapdienChatMessage> Function(StreamAskPhapdienChatRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StreamAskPhapdienChatProvider._internal(
        (ref) => create(ref as StreamAskPhapdienChatRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        question: question,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<PhapdienChatMessage> createElement() {
    return _StreamAskPhapdienChatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StreamAskPhapdienChatProvider && other.question == question;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, question.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StreamAskPhapdienChatRef
    on AutoDisposeStreamProviderRef<PhapdienChatMessage> {
  /// The parameter `question` of this provider.
  String get question;
}

class _StreamAskPhapdienChatProviderElement
    extends AutoDisposeStreamProviderElement<PhapdienChatMessage>
    with StreamAskPhapdienChatRef {
  _StreamAskPhapdienChatProviderElement(super.provider);

  @override
  String get question => (origin as StreamAskPhapdienChatProvider).question;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
