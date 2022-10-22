// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta, implicit_dynamic_parameter

part of 'alert_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlertTypeQuery _$AlertTypeQueryFromJson(Map<String, dynamic> json) =>
    AlertTypeQuery(
      page_count: json['page_count'] as int?,
      result: (json['result'] as List<dynamic>?)
              ?.map((e) => AlertType.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      success: json['success'] as bool? ?? false,
      total_count: json['total_count'] as int? ?? 0,
    );

Map<String, dynamic> _$AlertTypeQueryToJson(AlertTypeQuery instance) =>
    <String, dynamic>{
      'success': instance.success,
      'page_count': instance.page_count,
      'total_count': instance.total_count,
      'result': instance.result.map((e) => e.toJson()).toList(),
    };

AlertType _$AlertTypeFromJson(Map<String, dynamic> json) => AlertType(
      category:
          $enumDecodeNullable(_$AlertEnumCategoryEnumMap, json['category']),
      controller: json['controller'] as String?,
      creation_dt: json['creation_dt'] as String?,
      description: json['description'] as String?,
      family: $enumDecodeNullable(_$AlertEnumFamilyEnumMap, json['family']),
      id: json['_id'] as String?,
      modif_dt: json['modif_dt'] as String?,
      multiple: json['multiple'] as bool?,
      name: $enumDecodeNullable(_$AlertEnumNameEnumMap, json['name']),
      opt: json['opt'] == null
          ? null
          : AlertType.fromJson(json['opt'] as Map<String, dynamic>),
      public: json['public'] as bool?,
      tpl: json['tpl'] as String?,
      type: $enumDecodeNullable(_$AlertEnumTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$AlertTypeToJson(AlertType instance) => <String, dynamic>{
      'category': _$AlertEnumCategoryEnumMap[instance.category],
      'family': _$AlertEnumFamilyEnumMap[instance.family],
      'name': _$AlertEnumNameEnumMap[instance.name],
      'type': _$AlertEnumTypeEnumMap[instance.type],
      'multiple': instance.multiple,
      'public': instance.public,
      'opt': instance.opt?.toJson(),
      'controller': instance.controller,
      'creation_dt': instance.creation_dt,
      'description': instance.description,
      '_id': instance.id,
      'modif_dt': instance.modif_dt,
      'tpl': instance.tpl,
    };

const _$AlertEnumCategoryEnumMap = {
  AlertEnumCategory.REAL_TIME_ALERT: 'REAL_TIME_ALERT',
};

const _$AlertEnumFamilyEnumMap = {
  AlertEnumFamily.DRIVE_AND_SPEED: 'DRIVE_AND_SPEED',
  AlertEnumFamily.FUEL_ALERT_TYPE: 'FUEL_ALERT_TYPE',
  AlertEnumFamily.LOCATION: 'LOCATION',
  AlertEnumFamily.SENSORS: 'SENSORS',
  AlertEnumFamily.GPA: 'GPA',
};

const _$AlertEnumNameEnumMap = {
  AlertEnumName.DISABLE_DEVICE_ALERT: 'DISABLE_DEVICE_ALERT',
  AlertEnumName.DRIVE_OUT_OF_TIME_SLOT: 'DRIVE_OUT_OF_TIME_SLOT',
  AlertEnumName.ODOMETER_THRESHOLD: 'ODOMETER_THRESHOLD',
  AlertEnumName.ODOMETER_VARIATION: 'ODOMETER_VARIATION',
  AlertEnumName.MAINTENANCE_ANNUAL_TIME: 'MAINTENANCE_ANNUAL_TIME',
  AlertEnumName.MAINTENANCE_PERIODIC_TIME: 'MAINTENANCE_PERIODIC_TIME',
  AlertEnumName.GPS_COVERAGE_PROBLEM_ALERT: 'GPS_COVERAGE_PROBLEM_ALERT',
  AlertEnumName.IDLE_ALERT: 'IDLE_ALERT',
  AlertEnumName.IDLE_RPM_ALERT: 'IDLE_RPM_ALERT',
  AlertEnumName.OVER_SPEED: 'OVER_SPEED',
  AlertEnumName.POWER_LOST_ALERT: 'POWER_LOST_ALERT',
  AlertEnumName.REFUELING_ALERT: 'REFUELING_ALERT',
  AlertEnumName.OVER_SENSOR: 'OVER_SENSOR',
  AlertEnumName.LOW_SENSOR: 'LOW_SENSOR',
  AlertEnumName.STATUS_SENSOR: 'STATUS_SENSOR',
  AlertEnumName.SIPHONING_ALERT: 'SIPHONING_ALERT',
  AlertEnumName.STOP_OUT_MULTI_POI_ALERT: 'STOP_OUT_MULTI_POI_ALERT',
  AlertEnumName.STOP_OUT_POI_ALERT: 'STOP_OUT_POI_ALERT',
  AlertEnumName.STOP_OUT_SITE_ALERT: 'STOP_OUT_SITE_ALERT',
  AlertEnumName.TOTAL_CARD_ALERT: 'TOTAL_CARD_ALERT',
  AlertEnumName.TOWING_ALERT: 'TOWING_ALERT',
  AlertEnumName.ZONE_IN: 'ZONE_IN',
  AlertEnumName.ZONE_OUT: 'ZONE_OUT',
  AlertEnumName.ZONE_IN_OUT: 'ZONE_IN_OUT',
  AlertEnumName.CORRIDOR_OUT: 'CORRIDOR_OUT',
  AlertEnumName.NEAR_POI_CHECK: 'NEAR_POI_CHECK',
};

const _$AlertEnumTypeEnumMap = {
  AlertEnumType.DISABLE_DEVICE_ALERT: 'DISABLE_DEVICE_ALERT',
  AlertEnumType.DRIVE_OUT_OF_TIME_SLOT: 'DRIVE_OUT_OF_TIME_SLOT',
  AlertEnumType.GPA: 'GPA',
  AlertEnumType.GPS_COVERAGE_PROBLEM_ALERT: 'GPS_COVERAGE_PROBLEM_ALERT',
  AlertEnumType.IDLE_ALERT: 'IDLE_ALERT',
  AlertEnumType.IDLE_RPM_ALERT: 'IDLE_RPM_ALERT',
  AlertEnumType.OVER_SPEED: 'OVER_SPEED',
  AlertEnumType.POWER_LOST_ALERT: 'POWER_LOST_ALERT',
  AlertEnumType.REFUELING_ALERT: 'REFUELING_ALERT',
  AlertEnumType.SENSOR: 'SENSOR',
  AlertEnumType.SIPHONING_ALERT: 'SIPHONING_ALERT',
  AlertEnumType.STOP_OUT_MULTI_POI_ALERT: 'STOP_OUT_MULTI_POI_ALERT',
  AlertEnumType.STOP_OUT_POI_ALERT: 'STOP_OUT_POI_ALERT',
  AlertEnumType.STOP_OUT_SITE_ALERT: 'STOP_OUT_SITE_ALERT',
  AlertEnumType.TOTAL_CARD_ALERT: 'TOTAL_CARD_ALERT',
  AlertEnumType.TOWING_ALERT: 'TOWING_ALERT',
  AlertEnumType.ZONE: 'ZONE',
};

AlertTypeOpt _$AlertTypeOptFromJson(Map<String, dynamic> json) => AlertTypeOpt(
      checker: json['checker'] as String?,
      ignoredValues: json['ignoredValues'] as List<dynamic>?,
      labels: (json['labels'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      sensor: json['sensor'] as bool?,
      src: json['src'] as String?,
      stateless: json['stateless'] as bool?,
    );

Map<String, dynamic> _$AlertTypeOptToJson(AlertTypeOpt instance) =>
    <String, dynamic>{
      'sensor': instance.sensor,
      'stateless': instance.stateless,
      'labels': instance.labels,
      'ignoredValues': instance.ignoredValues,
      'checker': instance.checker,
      'src': instance.src,
    };
