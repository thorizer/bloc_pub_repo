// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleRepo _$RoleRepoFromJson(Map<String, dynamic> json) => RoleRepo(
      id: json['id'] as String?,
      childs:
          (json['childs'] as List<dynamic>?)?.map((dynamic e) => e as String).toList(),
      permissions: (json['permissions'] as Map<String, dynamic>?)?.map(
        (k, dynamic e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$RoleRepoToJson(RoleRepo instance) => <String, dynamic>{
      'childs': instance.childs,
      'id': instance.id,
      'permissions': instance.permissions,
    };
