// ignore_for_file: public_member_api_docs, non_constant_identifier_names, constant_identifier_names, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';

part 'role_repo.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class RoleRepo extends Equatable {
  const RoleRepo({
    required this.id,
    this.childs,
    this.permissions,
  });

  final List<String>? childs;
  final String? id;
  final Map<String,String>? permissions;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      childs,
      id,
      permissions,
    ];
  }

  /// Deserializes the given [JsonMap] into a [RoleRepo].
  static RoleRepo fromJson(JsonMap json) => _$RoleRepoFromJson(json);

  /// Converts this [RoleRepo] into a [JsonMap].
  JsonMap toJson() => _$RoleRepoToJson(this);

  RoleRepo copyWith({
    List<String>? childs,
    String? id,
    Map<String,String>? permissions,
  }) {
    return RoleRepo(
      childs: childs ?? this.childs,
      id: id ?? this.id,
      permissions: permissions ?? this.permissions,
    );
  }
}
