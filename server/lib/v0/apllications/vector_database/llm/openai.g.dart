// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'openai.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$openAIClientHash() => r'af049e737cd4ecd583f93d98eda70c13cc12234b';

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

/// See also [openAIClient].
@ProviderFor(openAIClient)
const openAIClientProvider = OpenAIClientFamily();

/// See also [openAIClient].
class OpenAIClientFamily extends Family<OpenAIClient> {
  /// See also [openAIClient].
  const OpenAIClientFamily();

  /// See also [openAIClient].
  OpenAIClientProvider call(
    String apiKey,
  ) {
    return OpenAIClientProvider(
      apiKey,
    );
  }

  @override
  OpenAIClientProvider getProviderOverride(
    covariant OpenAIClientProvider provider,
  ) {
    return call(
      provider.apiKey,
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
  String? get name => r'openAIClientProvider';
}

/// See also [openAIClient].
class OpenAIClientProvider extends AutoDisposeProvider<OpenAIClient> {
  /// See also [openAIClient].
  OpenAIClientProvider(
    String apiKey,
  ) : this._internal(
          (ref) => openAIClient(
            ref as OpenAIClientRef,
            apiKey,
          ),
          from: openAIClientProvider,
          name: r'openAIClientProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$openAIClientHash,
          dependencies: OpenAIClientFamily._dependencies,
          allTransitiveDependencies:
              OpenAIClientFamily._allTransitiveDependencies,
          apiKey: apiKey,
        );

  OpenAIClientProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.apiKey,
  }) : super.internal();

  final String apiKey;

  @override
  Override overrideWith(
    OpenAIClient Function(OpenAIClientRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OpenAIClientProvider._internal(
        (ref) => create(ref as OpenAIClientRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        apiKey: apiKey,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<OpenAIClient> createElement() {
    return _OpenAIClientProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OpenAIClientProvider && other.apiKey == apiKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, apiKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OpenAIClientRef on AutoDisposeProviderRef<OpenAIClient> {
  /// The parameter `apiKey` of this provider.
  String get apiKey;
}

class _OpenAIClientProviderElement
    extends AutoDisposeProviderElement<OpenAIClient> with OpenAIClientRef {
  _OpenAIClientProviderElement(super.provider);

  @override
  String get apiKey => (origin as OpenAIClientProvider).apiKey;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
