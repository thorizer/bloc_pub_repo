// ignore_for_file: public_member_api_docs, non_constant_identifier_names, constant_identifier_names, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';

part 'alert_type.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class AlertTypeQuery extends Equatable {
  const AlertTypeQuery({
    this.page_count,
    this.result = const [],
    this.success = false,
    this.total_count = 0,
  });

  final bool? success;
  final int? page_count;
  final int? total_count;
  final List<AlertType> result;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [result, total_count, page_count, success];

  /// Deserializes the given [JsonMap] into a [AlertTypeQuery].
  static AlertTypeQuery fromJson(JsonMap json) =>
      _$AlertTypeQueryFromJson(json);

  /// Converts this [AlertTypeQuery] into a [JsonMap].
  JsonMap toJson() => _$AlertTypeQueryToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class AlertType extends Equatable {
  const AlertType({
    this.category,
    this.controller,
    this.creation_dt,
    this.description,
    this.family,
    this.id,
    this.modif_dt,
    this.multiple,
    this.name,
    this.opt,
    this.public,
    this.tpl,
    this.type,
  });

  final AlertEnumCategory? category;
  final AlertEnumFamily? family;
  final AlertEnumName? name;
  final AlertEnumType? type;
  final bool? multiple;
  final bool? public;
  final AlertType? opt;
  final String? controller;
  final String? creation_dt;
  final String? description;
  @JsonKey(name: '_id')
  final String? id;
  final String? modif_dt;
  final String? tpl;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      category,
      controller,
      creation_dt,
      description,
      family,
      id,
      modif_dt,
      multiple,
      name,
      opt,
      public,
      tpl,
      type,
    ];
  }

   /// Deserializes the given [JsonMap] into a [AlertType].
  static AlertType fromJson(JsonMap json) => _$AlertTypeFromJson(json);

  /// Converts this [AlertType] into a [JsonMap].
  JsonMap toJson() => _$AlertTypeToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class AlertTypeOpt extends Equatable {
  const AlertTypeOpt({
    this.checker,
    this.ignoredValues,
    this.labels,
    this.sensor,
    this.src,
    this.stateless,
  });

  final bool? sensor;
  final bool? stateless;
  final Map<String, String>? labels;
  final List<dynamic>? ignoredValues;
  final String? checker;
  final String? src;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      sensor,
      stateless,
      labels,
      ignoredValues,
      checker,
      src,
    ];
  }

   /// Deserializes the given [JsonMap] into a [AlertTypeOpt].
  static AlertTypeOpt fromJson(JsonMap json) => _$AlertTypeOptFromJson(json);

  /// Converts this [AlertTypeOpt] into a [JsonMap].
  JsonMap toJson() => _$AlertTypeOptToJson(this);
}

enum AlertEnumCategory {
  @JsonValue('REAL_TIME_ALERT')
  REAL_TIME_ALERT
}
enum AlertEnumFamily {
  @JsonValue('DRIVE_AND_SPEED')
  DRIVE_AND_SPEED,
  @JsonValue('FUEL_ALERT_TYPE')
  FUEL_ALERT_TYPE,
  @JsonValue('LOCATION')
  LOCATION,
  @JsonValue('SENSORS')
  SENSORS,
  @JsonValue('GPA')
  GPA
}
enum AlertEnumType {
  @JsonValue('DISABLE_DEVICE_ALERT')
  DISABLE_DEVICE_ALERT,
  @JsonValue('DRIVE_OUT_OF_TIME_SLOT')
  DRIVE_OUT_OF_TIME_SLOT,
  @JsonValue('GPA')
  GPA,
  @JsonValue('GPS_COVERAGE_PROBLEM_ALERT')
  GPS_COVERAGE_PROBLEM_ALERT,
  @JsonValue('IDLE_ALERT')
  IDLE_ALERT,
  @JsonValue('IDLE_RPM_ALERT')
  IDLE_RPM_ALERT,
  @JsonValue('OVER_SPEED')
  OVER_SPEED,
  @JsonValue('POWER_LOST_ALERT')
  POWER_LOST_ALERT,
  @JsonValue('REFUELING_ALERT')
  REFUELING_ALERT,
  @JsonValue('SENSOR')
  SENSOR,
  @JsonValue('SIPHONING_ALERT')
  SIPHONING_ALERT,
  @JsonValue('STOP_OUT_MULTI_POI_ALERT')
  STOP_OUT_MULTI_POI_ALERT,
  @JsonValue('STOP_OUT_POI_ALERT')
  STOP_OUT_POI_ALERT,
  @JsonValue('STOP_OUT_SITE_ALERT')
  STOP_OUT_SITE_ALERT,
  @JsonValue('TOTAL_CARD_ALERT')
  TOTAL_CARD_ALERT,
  @JsonValue('TOWING_ALERT')
  TOWING_ALERT,
  @JsonValue('ZONE')
  ZONE,
}
enum AlertEnumName {
  @JsonValue('DISABLE_DEVICE_ALERT')
  DISABLE_DEVICE_ALERT,
  @JsonValue('DRIVE_OUT_OF_TIME_SLOT')
  DRIVE_OUT_OF_TIME_SLOT,
  @JsonValue('ODOMETER_THRESHOLD')
  ODOMETER_THRESHOLD,
  @JsonValue('ODOMETER_VARIATION')
  ODOMETER_VARIATION,
  @JsonValue('MAINTENANCE_ANNUAL_TIME')
  MAINTENANCE_ANNUAL_TIME,
  @JsonValue('MAINTENANCE_PERIODIC_TIME')
  MAINTENANCE_PERIODIC_TIME,
  @JsonValue('GPS_COVERAGE_PROBLEM_ALERT')
  GPS_COVERAGE_PROBLEM_ALERT,
  @JsonValue('IDLE_ALERT')
  IDLE_ALERT,
  @JsonValue('IDLE_RPM_ALERT')
  IDLE_RPM_ALERT,
  @JsonValue('OVER_SPEED')
  OVER_SPEED,
  @JsonValue('POWER_LOST_ALERT')
  POWER_LOST_ALERT,
  @JsonValue('REFUELING_ALERT')
  REFUELING_ALERT,
  @JsonValue('OVER_SENSOR')
  OVER_SENSOR,
  @JsonValue('LOW_SENSOR')
  LOW_SENSOR,
  @JsonValue('STATUS_SENSOR')
  STATUS_SENSOR,
  @JsonValue('SIPHONING_ALERT')
  SIPHONING_ALERT,
  @JsonValue('STOP_OUT_MULTI_POI_ALERT')
  STOP_OUT_MULTI_POI_ALERT,
  @JsonValue('STOP_OUT_POI_ALERT')
  STOP_OUT_POI_ALERT,
  @JsonValue('STOP_OUT_SITE_ALERT')
  STOP_OUT_SITE_ALERT,
  @JsonValue('TOTAL_CARD_ALERT')
  TOTAL_CARD_ALERT,
  @JsonValue('TOWING_ALERT')
  TOWING_ALERT,
  @JsonValue('ZONE_IN')
  ZONE_IN,
  @JsonValue('ZONE_OUT')
  ZONE_OUT,
  @JsonValue('ZONE_IN_OUT')
  ZONE_IN_OUT,
  @JsonValue('CORRIDOR_OUT')
  CORRIDOR_OUT,
  @JsonValue('NEAR_POI_CHECK')
  NEAR_POI_CHECK,
}
