// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta, implicit_dynamic_parameter

part of 'driver.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DriverQuery _$DriverQueryFromJson(Map<String, dynamic> json) => DriverQuery(
      page_count: json['page_count'] as int?,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => Driver.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      success: json['success'] as bool? ?? false,
      total_count: json['total_count'] as int? ?? 0,
    );

Map<String, dynamic> _$DriverQueryToJson(DriverQuery instance) =>
    <String, dynamic>{
      'success': instance.success,
      'result': instance.result.map((e) => e.toJson()).toList(),
      'page_count': instance.page_count,
      'total_count': instance.total_count,
    };

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      asset: json['_asset'] as String?,
      attributes: json['attributes'] == null
          ? null
          : DriverAttributes.fromJson(
              json['attributes'] as Map<String, dynamic>),
      company_owner: json['_company_owner'] as String?,
      contact: json['contact'] == null
          ? null
          : DriverContact.fromJson(json['contact'] as Map<String, dynamic>),
      creation_dt: json['creation_dt'] as String?,
      ctry: json['_ctry'] as String?,
      first_name: json['first_name'] as String?,
      id: json['_id'] as String,
      identifier: json['identifier'] as String?,
      last_name: json['last_name'] as String?,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      'attributes': instance.attributes?.toJson(),
      'contact': instance.contact?.toJson(),
      '_asset': instance.asset,
      '_company_owner': instance.company_owner,
      'creation_dt': instance.creation_dt,
      '_ctry': instance.ctry,
      'first_name': instance.first_name,
      '_id': instance.id,
      'identifier': instance.identifier,
      'last_name': instance.last_name,
      'picture': instance.picture,
    };

DriverAttributes _$DriverAttributesFromJson(Map<String, dynamic> json) =>
    DriverAttributes(
      code_driver: json['code_driver'] as String?,
    );

Map<String, dynamic> _$DriverAttributesToJson(DriverAttributes instance) =>
    <String, dynamic>{
      'code_driver': instance.code_driver,
    };

DriverContact _$DriverContactFromJson(Map<String, dynamic> json) =>
    DriverContact(
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      mail: json['mail'] as String?,
    );

Map<String, dynamic> _$DriverContactToJson(DriverContact instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'address': instance.address,
      'mail': instance.mail,
    };
