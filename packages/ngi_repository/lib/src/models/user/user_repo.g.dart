// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRepo _$UserRepoFromJson(Map<String, dynamic> json) => UserRepo(
      id: json['id'] as String,
      company_owner: json['company_owner'] as String?,
      fax: json['fax'] as String?,
      mail: json['mail'] as String?,
      phone: json['phone'] as String?,
      ctry: json['ctry'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      login: json['login'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UserRepoToJson(UserRepo instance) => <String, dynamic>{
      'company_owner': instance.company_owner,
      'ctry': instance.ctry,
      'first_name': instance.first_name,
      'id': instance.id,
      'last_name': instance.last_name,
      'login': instance.login,
      'fax': instance.fax,
      'mail': instance.mail,
      'phone': instance.phone,
      'role': instance.role,
    };
