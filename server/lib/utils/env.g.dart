// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Env _$EnvFromJson(Map<String, dynamic> json) => Env(
      openAIKeys: (json['OPENAI_API_KEYS'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      pineconeApiKey: json['PINECONE_API_KEY'] as String,
      pineconeEnvironment: json['PINECONE_ENVIRONMENT'] as String,
      pineconeProjectId: json['PINECONE_PROJECT_ID'] as String,
    );

Map<String, dynamic> _$EnvToJson(Env instance) => <String, dynamic>{
      'OPENAI_API_KEYS': instance.openAIKeys,
      'PINECONE_API_KEY': instance.pineconeApiKey,
      'PINECONE_ENVIRONMENT': instance.pineconeEnvironment,
      'PINECONE_PROJECT_ID': instance.pineconeProjectId,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$environmentHash() => r'f1721b25604ac10be735cadc1154aced9faf18a8';

/// See also [environment].
@ProviderFor(environment)
final environmentProvider = AutoDisposeProvider<Env>.internal(
  environment,
  name: r'environmentProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$environmentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef EnvironmentRef = AutoDisposeProviderRef<Env>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
