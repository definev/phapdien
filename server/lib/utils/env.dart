import 'dart:convert';
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'env.g.dart';

@JsonSerializable()
class Env {
  const Env({
    required this.openAIKeys,
    required this.pineconeApiKey,
    required this.pineconeEnvironment,
    required this.pineconeProjectId,
  });

  factory Env.fromJson(Map<String, dynamic> json) => _$EnvFromJson(json);

  @JsonKey(name: 'OPENAI_API_KEYS')
  final List<String> openAIKeys;
  @JsonKey(name: 'PINECONE_API_KEY')
  final String pineconeApiKey;
  @JsonKey(name: 'PINECONE_ENVIRONMENT')
  final String pineconeEnvironment;
  @JsonKey(name: 'PINECONE_PROJECT_ID')
  final String pineconeProjectId;

  Map<String, dynamic> toJson() => _$EnvToJson(this);
}

@riverpod
Env environment(EnvironmentRef ref) {
  final file = File('env/production.json');
  return Env.fromJson(json.decode(file.readAsStringSync()));
}