// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ask_phapdien_chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$askPhapdienChatHash() => r'fb4c10a9045da787fa19ab9462321e25db3860d1';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
