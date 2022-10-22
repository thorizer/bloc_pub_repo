// ignore_for_file: public_member_api_docs, non_constant_identifier_names, constant_identifier_names, lines_longer_than_80_chars
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';
part 'alert.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class AlertQuery extends Equatable {
  const AlertQuery({
    this.page_count,
    this.result = const [],
    this.success = false,
    this.total_count = 0,
  });
  final bool? success;
  final int? page_count;
  final int? total_count;
  final List<Alert> result;
  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [total_count, success];

  /// Deserializes the given [JsonMap] into a [AlertQuery].
  static AlertQuery fromJson(JsonMap json) => _$AlertQueryFromJson(json);

  /// Converts this [AlertQuery] into a [JsonMap].
  JsonMap toJson() => _$AlertQueryToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class Alert extends Equatable {
  const Alert({
    this.ack,
    //to fix
    this.alertConfig,
    this.alert_data,
    this.assetId,
    this.company_owner,
    this.end_dt,
    required this.id,
    this.loc,
    this.name,
    this.public,
    this.start_dt,
    this.status,
  });
  final AlertData? alert_data;
  final bool? ack;
  final bool? public;
  final int? status;
  final Loc? loc;
  @JsonKey(name: '_alertConfig')
  final AlertConfig? alertConfig;
  @JsonKey(name: '_assetId', fromJson: _getValue)
  final AssetIDInfo? assetId;
  @JsonKey(name: '_company_owner')
  final String? company_owner;
  final String? end_dt;
  @JsonKey(name: '_id')
  final String id;
  final String? name;
  final String? start_dt;

  static AssetIDInfo? _getValue(dynamic value) {
    if (value is String) {
      return AssetIDInfo(id: value);
    }

    return _$AssetIDInfoFromJson(value as Map<String, dynamic>);
  }

  @override
  bool get stringify => true;
  @override
  List<Object?> get props {
    return [
      alert_data,
      ack,
      public,
      status,
      loc,
      alertConfig,
      assetId,
      company_owner,
      end_dt,
      id,
      name,
      start_dt,
    ];
  }

  /// Deserializes the given [JsonMap] into a [Alert].
  static Alert fromJson(JsonMap json) => _$AlertFromJson(json);

  /// Converts this [Alert] into a [JsonMap].
  JsonMap toJson() => _$AlertToJson(this);
  Alert copyWith({
    AlertData? alert_data,
    bool? ack,
    bool? public,
    int? status,
    Loc? loc,
    AlertConfig? alertConfig,
    AssetIDInfo? assetId,
    String? company_owner,
    String? end_dt,
    String? id,
    String? name,
    String? start_dt,
  }) {
    return Alert(
      alert_data: alert_data ?? this.alert_data,
      ack: ack ?? this.ack,
      public: public ?? this.public,
      status: status ?? this.status,
      loc: loc ?? this.loc,
      alertConfig: alertConfig ?? this.alertConfig,
      assetId: assetId ?? this.assetId,
      company_owner: company_owner ?? this.company_owner,
      end_dt: end_dt ?? this.end_dt,
      id: id ?? this.id,
      name: name ?? this.name,
      start_dt: start_dt ?? this.start_dt,
    );
  }
}

@immutable
@JsonSerializable(explicitToJson: true)
class AssetIDInfo extends Equatable {
  const AssetIDInfo({
    this.id,
    this.name,
    this.type,
  });
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? type;
  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [id];

  /// Deserializes the given [JsonMap] into a [AssetIDInfo].
  static AssetIDInfo fromJson(JsonMap json) => _$AssetIDInfoFromJson(json);

  /// Converts this [AssetIDInfo] into a [JsonMap].
  JsonMap toJson() => _$AssetIDInfoToJson(this);
  AssetIDInfo copyWith({
    String? id,
    String? name,
    String? type,
  }) {
    return AssetIDInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }
}

@immutable
@JsonSerializable(explicitToJson: true)
class AlertConfig extends Equatable {
  const AlertConfig({
    this.id,
    this.name,
    this.type,
    this.config,
  });
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? type;
  final List<Config>? config;
  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [id];

  /// Deserializes the given [JsonMap] into a [AlertConfig].
  static AlertConfig fromJson(JsonMap json) => _$AlertConfigFromJson(json);

  /// Converts this [AlertConfig] into a [JsonMap].
  JsonMap toJson() => _$AlertConfigToJson(this);
  AlertConfig copyWith({
    String? id,
    String? name,
    String? type,
    List<Config>? config,
  }) {
    return AlertConfig(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      config: config ?? this.config,
    );
  }
}

@immutable
@JsonSerializable(explicitToJson: true)
class Config extends Equatable {
  Config({
    this.checker,
    this.data,
    this.id,
  });
  final String? checker;
  final AlertConfigData? data;
  @JsonKey(name: '_id')
  final String? id;
  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [checker, data, id];

  /// Deserializes the given [JsonMap] into a [Config].
  static Config fromJson(JsonMap json) => _$ConfigFromJson(json);

  /// Converts this [Config] into a [JsonMap].
  JsonMap toJson() => _$ConfigToJson(this);
  Config copyWith({
    String? checker,
    AlertConfigData? data,
    String? id,
  }) {
    return Config(
      checker: checker ?? this.checker,
      data: data ?? this.data,
      id: id ?? this.id,
    );
  }
}

@immutable
@JsonSerializable(explicitToJson: true)
class AlertConfigData extends Equatable {
  AlertConfigData({
    this.type,
    this.field,
    this.value,
    this.sensorId,
    this.zoneName,
  });
  final String? type;
  final String? field;
  @JsonKey(fromJson: _getValue)
  final num? value;
  final String? sensorId;
  final String? zoneName;
  static num? _getValue(dynamic value) {
    if (value is Map) {
      return null;
    }
    return value as num?;
  }

  /// Deserializes the given [JsonMap] into a [AlertConfigData].
  static AlertConfigData fromJson(JsonMap json) =>
      _$AlertConfigDataFromJson(json);

  /// Converts this [AlertConfigData] into a [JsonMap].
  JsonMap toJson() => _$AlertConfigDataToJson(this);
  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [type, field, sensorId];
  AlertConfigData copyWith({
    String? type,
    String? field,
    num? value,
    String? sensorId,
    String? zoneName,
  }) {
    return AlertConfigData(
      type: type ?? this.type,
      field: field ?? this.field,
      value: value ?? this.value,
      sensorId: sensorId ?? this.sensorId,
      zoneName: zoneName ?? this.zoneName,
    );
  }
}

@immutable
@JsonSerializable(explicitToJson: true)
class AlertData extends Equatable {
  const AlertData({
    this.description,
    this.outPolygonCheck0,
    this.greaterCheck0,
    this.greaterCheck,
    this.greaterCheck2,
    this.equalsCheck0,
    this.equalsCheck1,
  });
  final AlertDescription? description;
  @JsonKey(name: 'IN_OUT_POLYGON_CHECK_0')
  final OutPolygonCheck0? outPolygonCheck0;
  @JsonKey(name: 'GREATER_CHECK_0')
  final GreaterCheck? greaterCheck0;
  @JsonKey(name: 'GREATER_CHECK')
  final GreaterCheck? greaterCheck;
  @JsonKey(name: 'GREATER_CHECK_2')
  final GreaterCheck? greaterCheck2;
  @JsonKey(name: 'EQUALS_CHECK_0')
  final GreaterCheck? equalsCheck0;
  @JsonKey(name: 'EQUALS_CHECK_1')
  final GreaterCheck? equalsCheck1;
  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [
        description?.value,
        outPolygonCheck0?.zone_id,
        greaterCheck0?.value,
        greaterCheck?.value,
        greaterCheck2?.value,
        equalsCheck0?.value,
        equalsCheck1?.value,
      ];

  /// Deserializes the given [JsonMap] into a [AlertData].
  static AlertData fromJson(JsonMap json) => _$AlertDataFromJson(json);

  /// Converts this [AlertData] into a [JsonMap].
  JsonMap toJson() => _$AlertDataToJson(this);
  AlertData copyWith({
    AlertDescription? description,
    OutPolygonCheck0? outPolygonCheck0,
    GreaterCheck? greaterCheck0,
    GreaterCheck? greaterCheck,
    GreaterCheck? greaterCheck2,
    GreaterCheck? equalsCheck0,
    GreaterCheck? equalsCheck1,
  }) {
    return AlertData(
      description: description ?? this.description,
      outPolygonCheck0: outPolygonCheck0 ?? this.outPolygonCheck0,
      greaterCheck0: greaterCheck0 ?? this.greaterCheck0,
      greaterCheck: greaterCheck ?? this.greaterCheck,
      greaterCheck2: greaterCheck2 ?? this.greaterCheck2,
      equalsCheck0: equalsCheck0 ?? this.equalsCheck0,
      equalsCheck1: equalsCheck1 ?? this.equalsCheck1,
    );
  }
}

@immutable
@JsonSerializable(explicitToJson: true)
class AlertDescription extends Equatable {
  const AlertDescription({
    this.value,
    this.message,
  });
  @JsonKey(fromJson: _getValue)
  final String? value;
  final String? message;
  static String? _getValue(dynamic value) {
    if (value is int) {
      return null;
    }
    return value as String?;
  }

  /// Deserializes the given [JsonMap] into a [AlertDescription].
  static AlertDescription fromJson(JsonMap json) =>
      _$AlertDescriptionFromJson(json);

  /// Converts this [AlertDescription] into a [JsonMap].
  JsonMap toJson() => _$AlertDescriptionToJson(this);
  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [value, message];
  AlertDescription copyWith({
    String? value,
    String? message,
  }) {
    return AlertDescription(
      value: value ?? this.value,
      message: message ?? this.message,
    );
  }
}

@immutable
@JsonSerializable(explicitToJson: true)
class GreaterCheck extends Equatable {
  const GreaterCheck({
    this.value,
    this.threshold,
    this.field,
    this.checker,
  });
  @JsonKey(fromJson: _getValString, toJson: _getValString)
  final String? value;
  @JsonKey(fromJson: _getValString, toJson: _getValString)
  final String? threshold;
  final String? field;
  final String? checker;
  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [value, threshold, field, checker];

  /// Deserializes the given [JsonMap] into a [GreaterCheck].
  static GreaterCheck fromJson(JsonMap json) => _$GreaterCheckFromJson(json);

  /// Converts this [GreaterCheck] into a [JsonMap].
  JsonMap toJson() => _$GreaterCheckToJson(this);
  static String _getValString(dynamic value) {
    if (value is String) {
      return value;
    } else if (value is num) {
      return value.toString();
    } else {
      return '';
    }
  }

  GreaterCheck copyWith({
    String? value,
    String? threshold,
    String? field,
    String? checker,
  }) {
    return GreaterCheck(
      value: value ?? this.value,
      threshold: threshold ?? this.threshold,
      field: field ?? this.field,
      checker: checker ?? this.checker,
    );
  }
}

@immutable
@JsonSerializable(explicitToJson: true)
class OutPolygonCheck0 extends Equatable {
  const OutPolygonCheck0(
      {this.zone_id,
      this.zone,
      this.type,
      this.checker,
      this.field,
      this.coordinates});
  final String? zone_id;
  final String? zone;
  final String? type;
  final String? checker;
  final String? field;
  final List<List<double>>? coordinates;
  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [zone_id];
  OutPolygonCheck0 copyWith({
    String? zone_id,
    String? zone,
    String? type,
    String? checker,
    String? field,
    List<List<double>>? coordinates,
  }) {
    return OutPolygonCheck0(
      zone_id: zone_id ?? this.zone_id,
      zone: zone ?? this.zone,
      type: type ?? this.type,
      checker: checker ?? this.checker,
      field: field ?? this.field,
      coordinates: coordinates ?? this.coordinates,
    );
  }

  /// Deserializes the given [JsonMap] into a [OutPolygonCheck0].
  static OutPolygonCheck0 fromJson(JsonMap json) =>
      _$OutPolygonCheck0FromJson(json);

  /// Converts this [OutPolygonCheck0] into a [JsonMap].
  JsonMap toJson() => _$OutPolygonCheck0ToJson(this);
}
