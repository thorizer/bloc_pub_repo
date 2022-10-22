// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyOwnerRepo _$CompanyOwnerRepoFromJson(Map<String, dynamic> json) =>
    CompanyOwnerRepo(
      id: json['id'] as String,
      client_code: json['client_code'] as String?,
      company_owner: json['company_owner'] as String?,
      ctry: json['ctry'] as String?,
      currency: json['currency'] as String?,
      name: json['name'] as String?,
      fax: json['fax'] as String?,
      phone: json['phone'] as String?,
      mail: json['mail'] as String?,
      fraudRate: json['fraudRate'] as int?,
      tank_over: json['tank_over'] as int?,
      tank_under: json['tank_under'] as int?,
      tank_threshold: json['tank_threshold'] as int?,
      totalUsername: json['totalUsername'] as String?,
      totalPassword: json['totalPassword'] as String?,
      totalCheckAccess: json['totalCheckAccess'] as bool?,
    );

Map<String, dynamic> _$CompanyOwnerRepoToJson(CompanyOwnerRepo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client_code': instance.client_code,
      'company_owner': instance.company_owner,
      'ctry': instance.ctry,
      'currency': instance.currency,
      'name': instance.name,
      'fax': instance.fax,
      'phone': instance.phone,
      'mail': instance.mail,
      'fraudRate': instance.fraudRate,
      'tank_over': instance.tank_over,
      'tank_under': instance.tank_under,
      'tank_threshold': instance.tank_threshold,
      'totalUsername': instance.totalUsername,
      'totalPassword': instance.totalPassword,
      'totalCheckAccess': instance.totalCheckAccess,
    };
