// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta, implicit_dynamic_parameter

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyQuery _$CompanyQueryFromJson(Map<String, dynamic> json) => CompanyQuery(
      page_count: json['page_count'] as int?,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => CompanyOwner.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      success: json['success'] as bool? ?? false,
      total_count: json['total_count'] as int? ?? 0,
    );

Map<String, dynamic> _$CompanyQueryToJson(CompanyQuery instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result.map((e) => e.toJson()).toList(),
      'page_count': instance.page_count,
      'total_count': instance.total_count,
    };

CompanyOwnerResult _$CompanyOwnerResultFromJson(Map<String, dynamic> json) =>
    CompanyOwnerResult(
      success: json['success'] as bool?,
      result: json['result'] == null
          ? null
          : CompanyOwner.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyOwnerResultToJson(CompanyOwnerResult instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result?.toJson(),
    };

CompanyOwner _$CompanyOwnerFromJson(Map<String, dynamic> json) => CompanyOwner(
      alertActions: (json['alertActions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      alertModel: (json['_alertModel'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      alertType: (json['_alertType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      client_code: json['client_code'] as String?,
      company_owner: json['_company_owner'] as String?,
      contact: json['contact'] == null
          ? null
          : CompanyOwnerContact.fromJson(
              json['contact'] as Map<String, dynamic>),
      creation_dt: json['creation_dt'] as String?,
      ctry: json['_ctry'] as String?,
      currency: json['currency'] as String?,
      expiration_dt: json['expiration_dt'] as String?,
      geoDataType: (json['_geoDataType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['_id'] as String,
      layer:
          (json['_layer'] as List<dynamic>?)?.map((e) => e as String).toList(),
      module:
          (json['_module'] as List<dynamic>?)?.map((e) => e as String).toList(),
      name: json['name'] as String?,
      params: json['params'] == null
          ? null
          : CompanyOwnerParams.fromJson(json['params'] as Map<String, dynamic>),
      reports: (json['_reports'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      totalData: json['totalData'] == null
          ? null
          : TotalData.fromJson(json['totalData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyOwnerToJson(CompanyOwner instance) =>
    <String, dynamic>{
      'contact': instance.contact?.toJson(),
      'params': instance.params?.toJson(),
      'alertActions': instance.alertActions,
      '_alertModel': instance.alertModel,
      '_alertType': instance.alertType,
      '_geoDataType': instance.geoDataType,
      '_layer': instance.layer,
      '_module': instance.module,
      '_reports': instance.reports,
      'client_code': instance.client_code,
      '_company_owner': instance.company_owner,
      'creation_dt': instance.creation_dt,
      '_ctry': instance.ctry,
      'currency': instance.currency,
      'expiration_dt': instance.expiration_dt,
      '_id': instance.id,
      'name': instance.name,
      'totalData': instance.totalData?.toJson(),
    };

CompanyOwnerContact _$CompanyOwnerContactFromJson(Map<String, dynamic> json) =>
    CompanyOwnerContact(
      fax: json['fax'] as String?,
      phone: json['phone'] as String?,
      mail: json['mail'] as String?,
    );

Map<String, dynamic> _$CompanyOwnerContactToJson(
        CompanyOwnerContact instance) =>
    <String, dynamic>{
      'fax': instance.fax,
      'phone': instance.phone,
      'mail': instance.mail,
    };

CompanyOwnerParams _$CompanyOwnerParamsFromJson(Map<String, dynamic> json) =>
    CompanyOwnerParams(
      fraudRate: json['fraudRate'] as int?,
      tank_over: json['tank_over'] as int?,
      tank_under: json['tank_under'] as int?,
      tank_threshold: json['tank_threshold'] as int?,
    );

Map<String, dynamic> _$CompanyOwnerParamsToJson(CompanyOwnerParams instance) =>
    <String, dynamic>{
      'fraudRate': instance.fraudRate,
      'tank_over': instance.tank_over,
      'tank_under': instance.tank_under,
      'tank_threshold': instance.tank_threshold,
    };

TotalData _$TotalDataFromJson(Map<String, dynamic> json) => TotalData(
      username: json['username'] as String?,
      password: json['password'] as String?,
      check_access: json['check_access'] as bool?,
    );

Map<String, dynamic> _$TotalDataToJson(TotalData instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'check_access': instance.check_access,
    };
