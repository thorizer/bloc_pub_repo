// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta, implicit_dynamic_parameter

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserQuery _$UserQueryFromJson(Map<String, dynamic> json) => UserQuery(
      page_count: json['page_count'] as int?,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => User.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      success: json['success'] as bool? ?? false,
      total_count: json['total_count'] as int? ?? 0,
    );

Map<String, dynamic> _$UserQueryToJson(UserQuery instance) => <String, dynamic>{
      'success': instance.success,
      'page_count': instance.page_count,
      'total_count': instance.total_count,
      'result': instance.result.map((e) => e.toJson()).toList(),
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      alertModel: (json['_alertModel'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      alertType: (json['_alertType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      asset:
          (json['_asset'] as List<dynamic>?)?.map((e) => e as String).toList(),
      asset_groupe: (json['_asset_groupe'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      authentication_type: json['authentication_type'] as String?,
      company_owner: json['_company_owner'] as String?,
      contact: json['contact'] == null
          ? null
          : UserContact.fromJson(json['contact'] as Map<String, dynamic>),
      creation_dt: json['creation_dt'] as String?,
      ctry: json['_ctry'] as String?,
      expiration_dt: json['expiration_dt'] as String?,
      first_name: json['first_name'] as String?,
      geoDataType: (json['_geoDataType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['_id'] as String,
      last_name: json['last_name'] as String?,
      login: json['login'] as String?,
      module:
          (json['_module'] as List<dynamic>?)?.map((e) => e as String).toList(),
      private: json['private'] as bool?,
      reports: (json['_reports'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      role: json['_role'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'private': instance.private,
      '_alertModel': instance.alertModel,
      '_alertType': instance.alertType,
      '_asset': instance.asset,
      '_asset_groupe': instance.asset_groupe,
      '_geoDataType': instance.geoDataType,
      '_module': instance.module,
      '_reports': instance.reports,
      'authentication_type': instance.authentication_type,
      '_company_owner': instance.company_owner,
      'creation_dt': instance.creation_dt,
      '_ctry': instance.ctry,
      'expiration_dt': instance.expiration_dt,
      'first_name': instance.first_name,
      '_id': instance.id,
      'last_name': instance.last_name,
      'login': instance.login,
      'status': instance.status,
      'contact': instance.contact?.toJson(),
      '_role': instance.role,
    };

UserContact _$UserContactFromJson(Map<String, dynamic> json) => UserContact(
      fax: json['fax'] as String?,
      mail: json['mail'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserContactToJson(UserContact instance) =>
    <String, dynamic>{
      'fax': instance.fax,
      'mail': instance.mail,
      'phone': instance.phone,
    };
