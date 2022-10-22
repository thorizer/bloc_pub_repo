// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta, implicit_dynamic_parameter

part of 'alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlertQuery _$AlertQueryFromJson(Map<String, dynamic> json) => AlertQuery(
      page_count: json['page_count'] as int?,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => Alert.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      success: json['success'] as bool? ?? false,
      total_count: json['total_count'] as int? ?? 0,
    );

Map<String, dynamic> _$AlertQueryToJson(AlertQuery instance) =>
    <String, dynamic>{
      'success': instance.success,
      'page_count': instance.page_count,
      'total_count': instance.total_count,
      'result': instance.result.map((e) => e.toJson()).toList(),
    };

Alert _$AlertFromJson(Map<String, dynamic> json) => Alert(
      ack: json['ack'] as bool?,
      alertConfig: json['_alertConfig'] == null
          ? null
          : AlertConfig.fromJson(json['_alertConfig'] as Map<String, dynamic>),
      alert_data: json['alert_data'] == null
          ? null
          : AlertData.fromJson(json['alert_data'] as Map<String, dynamic>),
      assetId: Alert._getValue(json['_assetId']),
      company_owner: json['_company_owner'] as String?,
      end_dt: json['end_dt'] as String?,
      id: json['_id'] as String,
      loc: json['loc'] == null
          ? null
          : Loc.fromJson(json['loc'] as Map<String, dynamic>),
      name: json['name'] as String?,
      public: json['public'] as bool?,
      start_dt: json['start_dt'] as String?,
      status: json['status'] as int?,
    );

Map<String, dynamic> _$AlertToJson(Alert instance) => <String, dynamic>{
      'alert_data': instance.alert_data?.toJson(),
      'ack': instance.ack,
      'public': instance.public,
      'status': instance.status,
      'loc': instance.loc?.toJson(),
      '_alertConfig': instance.alertConfig?.toJson(),
      '_assetId': instance.assetId?.toJson(),
      '_company_owner': instance.company_owner,
      'end_dt': instance.end_dt,
      '_id': instance.id,
      'name': instance.name,
      'start_dt': instance.start_dt,
    };

AssetIDInfo _$AssetIDInfoFromJson(Map<String, dynamic> json) => AssetIDInfo(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$AssetIDInfoToJson(AssetIDInfo instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'type': instance.type,
    };

AlertConfig _$AlertConfigFromJson(Map<String, dynamic> json) => AlertConfig(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      config: (json['config'] as List<dynamic>?)
          ?.map((e) => Config.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlertConfigToJson(AlertConfig instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'config': instance.config?.map((e) => e.toJson()).toList(),
    };

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      checker: json['checker'] as String?,
      data: json['data'] == null
          ? null
          : AlertConfigData.fromJson(json['data'] as Map<String, dynamic>),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'checker': instance.checker,
      'data': instance.data?.toJson(),
      '_id': instance.id,
    };

AlertConfigData _$AlertConfigDataFromJson(Map<String, dynamic> json) =>
    AlertConfigData(
      type: json['type'] as String?,
      field: json['field'] as String?,
      value: AlertConfigData._getValue(json['value']),
      sensorId: json['sensorId'] as String?,
      zoneName: json['zoneName'] as String?,
    );

Map<String, dynamic> _$AlertConfigDataToJson(AlertConfigData instance) =>
    <String, dynamic>{
      'type': instance.type,
      'field': instance.field,
      'value': instance.value,
      'sensorId': instance.sensorId,
      'zoneName': instance.zoneName,
    };

AlertData _$AlertDataFromJson(Map<String, dynamic> json) => AlertData(
      description: json['description'] == null
          ? null
          : AlertDescription.fromJson(
              json['description'] as Map<String, dynamic>),
      outPolygonCheck0: json['IN_OUT_POLYGON_CHECK_0'] == null
          ? null
          : OutPolygonCheck0.fromJson(
              json['IN_OUT_POLYGON_CHECK_0'] as Map<String, dynamic>),
      greaterCheck0: json['GREATER_CHECK_0'] == null
          ? null
          : GreaterCheck.fromJson(
              json['GREATER_CHECK_0'] as Map<String, dynamic>),
      greaterCheck: json['GREATER_CHECK'] == null
          ? null
          : GreaterCheck.fromJson(
              json['GREATER_CHECK'] as Map<String, dynamic>),
      greaterCheck2: json['GREATER_CHECK_2'] == null
          ? null
          : GreaterCheck.fromJson(
              json['GREATER_CHECK_2'] as Map<String, dynamic>),
      equalsCheck0: json['EQUALS_CHECK_0'] == null
          ? null
          : GreaterCheck.fromJson(
              json['EQUALS_CHECK_0'] as Map<String, dynamic>),
      equalsCheck1: json['EQUALS_CHECK_1'] == null
          ? null
          : GreaterCheck.fromJson(
              json['EQUALS_CHECK_1'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AlertDataToJson(AlertData instance) => <String, dynamic>{
      'description': instance.description?.toJson(),
      'IN_OUT_POLYGON_CHECK_0': instance.outPolygonCheck0?.toJson(),
      'GREATER_CHECK_0': instance.greaterCheck0?.toJson(),
      'GREATER_CHECK': instance.greaterCheck?.toJson(),
      'GREATER_CHECK_2': instance.greaterCheck2?.toJson(),
      'EQUALS_CHECK_0': instance.equalsCheck0?.toJson(),
      'EQUALS_CHECK_1': instance.equalsCheck1?.toJson(),
    };

AlertDescription _$AlertDescriptionFromJson(Map<String, dynamic> json) =>
    AlertDescription(
      value: AlertDescription._getValue(json['value']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AlertDescriptionToJson(AlertDescription instance) =>
    <String, dynamic>{
      'value': instance.value,
      'message': instance.message,
    };

GreaterCheck _$GreaterCheckFromJson(Map<String, dynamic> json) => GreaterCheck(
      value: GreaterCheck._getValString(json['value']),
      threshold: GreaterCheck._getValString(json['threshold']),
      field: json['field'] as String?,
      checker: json['checker'] as String?,
    );

Map<String, dynamic> _$GreaterCheckToJson(GreaterCheck instance) =>
    <String, dynamic>{
      'value': GreaterCheck._getValString(instance.value),
      'threshold': GreaterCheck._getValString(instance.threshold),
      'field': instance.field,
      'checker': instance.checker,
    };

OutPolygonCheck0 _$OutPolygonCheck0FromJson(Map<String, dynamic> json) =>
    OutPolygonCheck0(
      zone_id: json['zone_id'] as String?,
      zone: json['zone'] as String?,
      type: json['type'] as String?,
      checker: json['checker'] as String?,
      field: json['field'] as String?,
      coordinates: (json['coordinates'] as List<dynamic>?)
          ?.map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toDouble()).toList())
          .toList(),
    );

Map<String, dynamic> _$OutPolygonCheck0ToJson(OutPolygonCheck0 instance) =>
    <String, dynamic>{
      'zone_id': instance.zone_id,
      'zone': instance.zone,
      'type': instance.type,
      'checker': instance.checker,
      'field': instance.field,
      'coordinates': instance.coordinates,
    };
