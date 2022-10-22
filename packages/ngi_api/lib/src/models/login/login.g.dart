// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta, implicit_dynamic_parameter

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginResult _$UserLoginResultFromJson(Map<String, dynamic> json) =>
    UserLoginResult(
      success: json['success'] as bool?,
      result: json['result'] == null
          ? null
          : LoginResult.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserLoginResultToJson(UserLoginResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result?.toJson(),
    };

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => LoginResult(
      user: json['user'] == null
          ? null
          : UserLogin.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      expirationDate: json['expirationDate'] as String?,
      tokenId: json['tokenId'] as String?,
    );

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'token': instance.token,
      'expirationDate': instance.expirationDate,
      'tokenId': instance.tokenId,
    };

UserLogin _$UserLoginFromJson(Map<String, dynamic> json) => UserLogin(
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
      company_owner: json['_company_owner'] == null
          ? null
          : CompanyOwner.fromJson(
              json['_company_owner'] as Map<String, dynamic>),
      contact: json['contact'] == null
          ? null
          : UserLoginContact.fromJson(json['contact'] as Map<String, dynamic>),
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
      role: json['_role'] == null
          ? null
          : Role.fromJson(json['_role'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UserLoginToJson(UserLogin instance) => <String, dynamic>{
      'private': instance.private,
      '_alertModel': instance.alertModel,
      '_alertType': instance.alertType,
      '_asset': instance.asset,
      '_asset_groupe': instance.asset_groupe,
      '_geoDataType': instance.geoDataType,
      '_module': instance.module,
      '_reports': instance.reports,
      'authentication_type': instance.authentication_type,
      '_company_owner': instance.company_owner?.toJson(),
      'creation_dt': instance.creation_dt,
      '_ctry': instance.ctry,
      'expiration_dt': instance.expiration_dt,
      'first_name': instance.first_name,
      '_id': instance.id,
      'last_name': instance.last_name,
      'login': instance.login,
      'status': instance.status,
      'contact': instance.contact?.toJson(),
      '_role': instance.role?.toJson(),
    };

UserLoginContact _$UserLoginContactFromJson(Map<String, dynamic> json) =>
    UserLoginContact(
      fax: json['fax'] as String?,
      mail: json['mail'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$UserLoginContactToJson(UserLoginContact instance) =>
    <String, dynamic>{
      'fax': instance.fax,
      'mail': instance.mail,
      'phone': instance.phone,
    };

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      childs:
          (json['_childs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      creation_dt: json['creation_dt'] as String?,
      description: json['description'] as String?,
      id: json['_id'] as String?,
      modif_dt: json['modif_dt'] as String?,
      module:
          (json['_module'] as List<dynamic>?)?.map((e) => e as String).toList(),
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      '_module': instance.module,
      '_childs': instance.childs,
      'permissions': instance.permissions,
      'creation_dt': instance.creation_dt,
      'description': instance.description,
      '_id': instance.id,
      'modif_dt': instance.modif_dt,
    };
