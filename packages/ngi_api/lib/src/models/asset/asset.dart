// ignore_for_file: non_constant_identifier_names, public_member_api_docs
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';
part 'asset.g.dart';

/// {@template ASSET}
/// An asst list.
///
/// Contains a [success], [total_count] , [page_count] and [result],
///
/// [result]s are immutable and can be copied using [copyWith], in addition to
/// being serialized and deserialized using [toJson] and [fromJson]
/// respectively.
/// {@endtemplate}
@immutable
@JsonSerializable(explicitToJson: true)
class AssetQuery extends Equatable {
  /// {@macro AssetQuery}
  const AssetQuery({
    this.page_count,
    this.result = const [],
    this.success = false,
    this.total_count = 0,
  });

  /// return true if the request was successful.
  final bool success;

  /// The asset list from the requested querry.
  final List<Asset> result;

  /// The page_count from the requested querry.
  final int? page_count;

  /// The total_count from the requested querry.
  final int? total_count;
  @override
  List<Object?> get props => [result.length, total_count, page_count, success];

  /// Deserializes the given [JsonMap] into a [AssetQuery].
  static AssetQuery fromJson(JsonMap json) => _$AssetQueryFromJson(json);

  /// Converts this [AssetQuery] into a [JsonMap].
  JsonMap toJson() => _$AssetQueryToJson(this);

  /// Returns a copy of this AssetQuery with the given values updated.
  ///
  /// {@macro AssetQuery}
  AssetQuery copyWith({
    bool? success,
    List<Asset>? result,
    int? page_count,
    int? total_count,
  }) {
    return AssetQuery(
      page_count: page_count ?? this.page_count,
      result: result ?? this.result,
      success: success ?? this.success,
      total_count: total_count ?? this.total_count,
    );
  }
}

@immutable
@JsonSerializable(explicitToJson: true)
class AssetIds extends Equatable {
  /// {@macro AssetQuery}
  const AssetIds({
    this.page_count,
    this.result = const [],
    this.success = false,
    this.total_count = 0,
  });

  /// return true if the request was successful.
  final bool success;

  /// The asset list from the requested querry.
  @JsonKey(fromJson: _getList)
  final List<String> result;

  /// The page_count from the requested querry.
  final int? page_count;

  /// The total_count from the requested querry.
  final int? total_count;
  @override
  List<Object?> get props => [result, total_count, page_count, success];
  static List<String> _getList(dynamic value) {
    if (value is List && value.isNotEmpty) {
      final Map<String, dynamic> idsResult =
          value.first as Map<String, dynamic>;
      if (idsResult['ids'] != null) {
        final List<dynamic> idsList = idsResult['ids'] as List<dynamic>;
        return idsList.map((dynamic e) => e.toString()).toList();
      }
    }
    return <String>[];
  }

  /// Deserializes the given [JsonMap] into a [AssetIds].
  static AssetIds fromJson(JsonMap json) => _$AssetIdsFromJson(json);

  /// Converts this [AssetIds] into a [JsonMap].
  JsonMap toJson() => _$AssetIdsToJson(this);

  /// Returns a copy of this AssetIds with the given values updated.
  ///
  /// {@macro AssetIds}
  AssetIds copyWith({
    bool? success,
    List<String>? result,
    int? page_count,
    int? total_count,
  }) {
    return AssetIds(
      page_count: page_count ?? this.page_count,
      result: result ?? this.result,
      success: success ?? this.success,
      total_count: total_count ?? this.total_count,
    );
  }
}

@immutable
@JsonSerializable(explicitToJson: true)
class Asset extends Equatable {
  /// {@macro Asset}
  const Asset({
    this.alerts,
    this.attributes,
    this.brand,
    this.codeProduct,
    this.company_owner,
    this.createdBy,
    this.creation_dt,
    this.Detailtype,
    this.dev,
    this.disabled,
    this.fleet,
    this.fuel,
    required this.id,
    this.idCard,
    this.meterType,
    this.model,
    this.modif_dt,
    this.name,
    this.notMonitor,
    this.product_total,
    this.rt,
    this.sensors,
    this.driver,
    this.stial_daily_odo,
    this.stial_name,
    this.stial_odo_dt,
    this.stial_odo,
    this.type,
  });

  /// The unique identifier of the Asset.
  ///
  /// Cannot be empty.
  final AssetDetailtype? Detailtype;
  @JsonKey(fromJson: _getType)
  final AssetType? type;
  final AssetAttributes? attributes;
  final Driver? driver;
  final bool? disabled;
  final bool? notMonitor;
  final double? idCard;
  final double? stial_daily_odo;
  final double? stial_odo;
  final List<String>? fleet;
  final FuelType? fuel;
  final List<dynamic>? alerts;
  final List<Sensor>? sensors;
  final MeterType? meterType;
  final Rt? rt;
  @JsonKey(name: '_id')
  final String id;
  final String? brand;
  final String? codeProduct;
  @JsonKey(name: '_company_owner')
  final String? company_owner;
  final String? createdBy;
  final String? creation_dt;
  @JsonKey(name: '_dev')
  final String? dev;
  final String? model;
  final String? modif_dt;
  final String? name;
  final String? product_total;
  final String? stial_name;
  final String? stial_odo_dt;
  static AssetType _getType(dynamic value) {

    if (value is Map) {
       //print(value);
      //print(_$AssetTypeMobFromJson(value as Map<String, dynamic>).id);
      final String type =
          _$AssetTypeMobFromJson(value as Map<String, dynamic>).id ?? 'truck';
      return AssetType.values.firstWhere(
          (AssetType e) => e.name.toLowerCase() == type.toLowerCase(),
          orElse: (() => AssetType.truck));
    } else if (value is String) {
      return AssetType.values.firstWhere(
          (AssetType e) => e.name.toLowerCase() == value.toLowerCase(),
          orElse: (() => AssetType.truck));
    } else {
      return AssetType.truck;
    }
  }

  /// Deserializes the given [JsonMap] into a [Asset].
  static Asset fromJson(JsonMap json) => _$AssetFromJson(json);

  /// Converts this [Asset] into a [JsonMap].
  JsonMap toJson() => _$AssetToJson(this);

  /// Returns a copy of this AssetQuery with the given values updated.
  ///
  /// {@macro Asset}
  Asset copyWith({
    AssetDetailtype? Detailtype,
    AssetType? type,
    AssetAttributes? attributes,
    Driver? driver,
    bool? disabled,
    bool? notMonitor,
    double? idCard,
    double? stial_daily_odo,
    double? stial_odo,
    List<String>? fleet,
    FuelType? fuel,
    List<dynamic>? alerts,
    List<Sensor>? sensors,
    MeterType? meterType,
    Rt? rt,
    String? brand,
    String? codeProduct,
    String? company_owner,
    String? createdBy,
    String? creation_dt,
    String? dev,
    String? id,
    String? model,
    String? modif_dt,
    String? name,
    String? product_total,
    String? stial_name,
    String? stial_odo_dt,
  }) {
    return Asset(
      alerts: alerts ?? this.alerts,
      attributes: attributes ?? this.attributes,
      brand: brand ?? this.brand,
      codeProduct: codeProduct ?? this.codeProduct,
      company_owner: company_owner ?? this.company_owner,
      createdBy: createdBy ?? this.createdBy,
      creation_dt: creation_dt ?? this.creation_dt,
      Detailtype: Detailtype ?? this.Detailtype,
      dev: dev ?? this.dev,
      disabled: disabled ?? this.disabled,
      fleet: fleet ?? this.fleet,
      fuel: fuel ?? this.fuel,
      id: id ?? this.id,
      idCard: idCard ?? this.idCard,
      meterType: meterType ?? this.meterType,
      model: model ?? this.model,
      modif_dt: modif_dt ?? this.modif_dt,
      name: name ?? this.name,
      notMonitor: notMonitor ?? this.notMonitor,
      product_total: product_total ?? this.product_total,
      sensors: sensors ?? this.sensors,
      driver: driver ?? this.driver,
      stial_daily_odo: stial_daily_odo ?? this.stial_daily_odo,
      stial_name: stial_name ?? this.stial_name,
      stial_odo_dt: stial_odo_dt ?? this.stial_odo_dt,
      stial_odo: stial_odo ?? this.stial_odo,
      type: type ?? this.type,
    );
  }

  @override
  toString() {
    return 'Asset(Detailtype: $Detailtype, type: $type, attributes: $attributes, disabled: $disabled, notMonitor: $notMonitor, idCard: $idCard, stial_daily_odo: $stial_daily_odo, stial_odo: $stial_odo, fleet: $fleet, fuel: $fuel, alerts: $alerts, sensors: $sensors, meterType: $meterType, rt: $rt, id: $id, brand: $brand, codeProduct: $codeProduct, company_owner: $company_owner, createdBy: $createdBy, creation_dt: $creation_dt, dev: $dev, model: $model, modif_dt: $modif_dt, name: $name, product_total: $product_total, stial_name: $stial_name, stial_odo_dt: $stial_odo_dt)';
  }

  @override
  List<Object?> get props {
    return [
      id,
    ];
  }
}

@JsonSerializable(explicitToJson: true)
class AssetTypeMob extends Equatable {
  const AssetTypeMob({
    this.id,
    this.mobility,
  });
  @JsonKey(name: '_id')
  final String? id;
  final bool? mobility;

  /// Deserializes the given [JsonMap] into a [AssetTypeMob].
  static AssetTypeMob fromJson(JsonMap json) => _$AssetTypeMobFromJson(json);

  /// Converts this [AssetTypeMob] into a [JsonMap].
  JsonMap toJson() => _$AssetTypeMobToJson(this);

  /// Returns a copy of this AssetTypeMob with the given values updated.
  ///
  /// {@macro AssetTypeMob}
  AssetTypeMob copyWith({
    String? id,
    bool? mobility,
  }) {
    return AssetTypeMob(
      id: id ?? this.id,
      mobility: mobility ?? this.mobility,
    );
  }

  @override
  toString() {
    return 'AssetTypeMob(id: $id, mobility: $mobility)';
  }

  @override
  List<Object?> get props {
    return [
      id,
    ];
  }
}

@JsonSerializable(explicitToJson: true)
class Sensor extends Equatable {
  /// {@macro Sensor}
  const Sensor({
    this.disableFuelInStop,
    this.enableFuelInStop,
    this.enableFuncPolynomial,
    this.family,
    this.id,
    this.isAbsolute,
    this.max,
    this.maxSrc,
    this.min,
    this.minSrc,
    this.name,
    this.off,
    this.on,
    this.refuelingConfig,
    this.src,
    this.type,
    this.sensorExtraType,
    this.unit,
    this.visible,
    this.calculWithGap,
    this.gaps,
    this.start_dt,
  });
  final bool? disableFuelInStop;
  final bool? enableFuelInStop;
  final bool? enableFuncPolynomial;
  final bool? isAbsolute;
  final bool? refuelingConfig;
  final bool? visible;
  final int? off;
  final int? on;
  final num? max;
  final num? maxSrc;
  final num? min;
  final num? minSrc;
  final SensorFamily? family;
  final SensorType? type;
  final SensorExtraType? sensorExtraType;
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? src;
  final Unit? unit;
  final bool? calculWithGap;
  final List<Gap>? gaps;
  final String? start_dt;

  /// Deserializes the given [JsonMap] into a [Sensor].
  static Sensor fromJson(JsonMap json) => _$SensorFromJson(json);

  /// Converts this [Sensor] into a [JsonMap].
  JsonMap toJson() => _$SensorToJson(this);

  /// Returns a copy of this Sensor with the given values updated.
  ///
  /// {@macro Sensor}
  Sensor copyWith({
    final bool? disableFuelInStop,
    final bool? enableFuelInStop,
    final bool? enableFuncPolynomial,
    final bool? isAbsolute,
    final bool? refuelingConfig,
    final bool? visible,
    final int? off,
    final int? on,
    final num? max,
    final num? maxSrc,
    final num? min,
    final num? minSrc,
    final SensorFamily? family,
    final SensorType? type,
    final SensorExtraType? sensorExtraType,
    final String? id,
    final String? name,
    final String? src,
    final Unit? unit,
    final bool? calculWithGap,
    final List<Gap>? gaps,
    final String? start_dt,
  }) {
    return Sensor(
      disableFuelInStop: disableFuelInStop ?? this.disableFuelInStop,
      enableFuelInStop: enableFuelInStop ?? this.enableFuelInStop,
      enableFuncPolynomial: enableFuncPolynomial ?? this.enableFuncPolynomial,
      family: family ?? this.family,
      id: id ?? this.id,
      isAbsolute: isAbsolute ?? this.isAbsolute,
      max: max ?? this.max,
      maxSrc: maxSrc ?? this.maxSrc,
      min: min ?? this.min,
      minSrc: minSrc ?? this.minSrc,
      name: name ?? this.name,
      off: off ?? this.off,
      on: on ?? this.on,
      refuelingConfig: refuelingConfig ?? this.refuelingConfig,
      src: src ?? this.src,
      type: type ?? this.type,
      sensorExtraType: sensorExtraType ?? this.sensorExtraType,
      unit: unit ?? this.unit,
      visible: visible ?? this.visible,
      calculWithGap: calculWithGap ?? this.calculWithGap,
      gaps: gaps ?? this.gaps,
      start_dt: start_dt ?? this.start_dt,
    );
  }

  @override //tostring
  toString() {
    return 'Sensor(disableFuelInStop: $disableFuelInStop, enableFuelInStop: $enableFuelInStop, enableFuncPolynomial: $enableFuncPolynomial, family: $family, id: $id, isAbsolute: $isAbsolute, max: $max, maxSrc: $maxSrc, min: $min, minSrc: $minSrc, name: $name, off: $off, on: $on, refuelingConfig: $refuelingConfig, src: $src, type: $type, sensorExtraType: $sensorExtraType, unit: $unit, visible: $visible, calculWithGap: $calculWithGap, gaps: $gaps, start_dt: $start_dt)';
  }

  @override
  List<Object?> get props {
    return [
      family,
      id,
      type,
    ];
  }
}

@JsonSerializable(explicitToJson: true)
class Gap extends Equatable {
  /// {@macro AssetAttributes}
  const Gap({this.maxSrcGap, this.gapValue, this.minSrcGap});
  final num? maxSrcGap;
  final num? minSrcGap;
  final num? gapValue;

  /// Deserializes the given [JsonMap] into a [Gap].
  static Gap fromJson(JsonMap json) => _$GapFromJson(json);

  /// Converts this [Gap] into a [JsonMap].
  JsonMap toJson() => _$GapToJson(this);

  /// Returns a copy of this AssetAttributes with the given values updated.
  ///
  /// {@macro AssetAttributes}
  Gap copyWith({
    final num? maxSrcGap,
    final num? minSrcGap,
    final num? gapValue,
  }) {
    return Gap(
      maxSrcGap: maxSrcGap ?? this.maxSrcGap,
      minSrcGap: minSrcGap ?? this.minSrcGap,
      gapValue: gapValue ?? this.gapValue,
    );
  }

  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [maxSrcGap, minSrcGap, gapValue];
}

@JsonSerializable(explicitToJson: true)
class AssetAttributes extends Equatable {
  /// {@macro AssetAttributes}
  const AssetAttributes({this.category, this.zone});
  final String? category;
  final String? zone;

  /// Deserializes the given [JsonMap] into a [AssetAttributes].
  static AssetAttributes fromJson(JsonMap json) =>
      _$AssetAttributesFromJson(json);

  /// Converts this [AssetAttributes] into a [JsonMap].
  JsonMap toJson() => _$AssetAttributesToJson(this);

  /// Returns a copy of this AssetAttributes with the given values updated.
  ///
  /// {@macro AssetAttributes}
  AssetAttributes copyWith({
    String? category,
    String? zone,
  }) {
    return AssetAttributes(
      category: category ?? this.category,
      zone: zone ?? this.zone,
    );
  }

  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [category, zone];
}

@JsonSerializable(explicitToJson: true)
class Loc extends Equatable {
  /// {@macro Loc}
  const Loc({
    this.coordinates_dt,
    this.coordinates,
    this.type_dt,
    this.type,
  });
  @JsonKey(fromJson: _getCodinates)
  final List<double>? coordinates;
  final String? coordinates_dt;
  final String? type_dt;
  final String? type;
  static List<double> _getCodinates(dynamic value) {
    if (value is List) {
      return value.map((dynamic e) {
        if (e is double) {
          return e;
        } else if (e is int) {
          return e.toDouble();
        } else if (e is String) {
          return double.parse(e);
        } else {
          return 0.0;
        }
      }).toList();
    }
    return [0.0, 0.0];
  }

  /// Deserializes the given [JsonMap] into a [Loc].
  static Loc fromJson(JsonMap json) => _$LocFromJson(json);

  /// Converts this [Loc] into a [JsonMap].
  JsonMap toJson() => _$LocToJson(this);

  /// Returns a copy of this Io with the given values updated.
  ///
  /// {@macro Loc}
  Loc copyWith({
    List<double>? coordinates,
    String? coordinates_dt,
    String? type_dt,
    String? type,
  }) {
    return Loc(
      coordinates_dt: coordinates_dt,
      coordinates: coordinates,
      type_dt: type_dt,
      type: type,
    );
  }

  @override
  bool get stringify => true;
  @override
  List<Object?> get props => [coordinates];
}

@JsonSerializable(
  explicitToJson: true,
)
class Rt extends Equatable {
  /// {@macro RT}
  const Rt({
    this.CANBUSDATA_dt,
    this.CANBUSDATA,
    this.consL_Km,
    this.gps_dt,
    this.io_dt,
    this.io,
    this.last_stop_dt,
    this.loc_dt,
    this.loc,
    this.odo,
    this.srv_dt,
    this.uid_dt,
    this.uid,
    this.working_time,
  });
  final double? odo;
  final Loc? loc;
  final Map<String, Object?>? CANBUSDATA;
  final Map<String, Object?>? io;
  final num? working_time;
  final String? CANBUSDATA_dt;
  final String? consL_Km;
  final String? gps_dt;
  final String? io_dt;
  final String? last_stop_dt;
  final String? loc_dt;
  final String? srv_dt;
  @JsonKey(
    fromJson: _get_uid_dt,
  )
  final String? uid_dt;
  @JsonKey(
    fromJson: _get_uid_dt,
  )
  final String? uid;

  /// Deserializes the given [JsonMap] into a [Rt].
  static Rt fromJson(JsonMap json) => _$RtFromJson(json);

  /// Converts this [Rt] into a [JsonMap].
  JsonMap toJson() => _$RtToJson(this);
  static String? _get_uid_dt(dynamic value) {
    if (value is String) {
      return value;
    } else if (value is num) {
      return value.toString();
    } else {
      return null;
    }
  }

  /// Returns a copy of this Io with the given values updated.
  ///
  /// {@macro Io}
  Rt copyWith({
    double? odo,
    Loc? loc,
    Map<String, Object?>? CANBUSDATA,
    Map<String, Object?>? io,
    num? working_time,
    String? CANBUSDATA_dt,
    String? consL_Km,
    String? gps_dt,
    String? io_dt,
    String? last_stop_dt,
    String? loc_dt,
    String? srv_dt,
    String? uid_dt,
    String? uid,
  }) {
    return Rt(
      CANBUSDATA_dt: CANBUSDATA_dt ?? this.CANBUSDATA_dt,
      CANBUSDATA: CANBUSDATA ?? this.CANBUSDATA,
      consL_Km: consL_Km ?? this.consL_Km,
      gps_dt: gps_dt ?? this.gps_dt,
      io_dt: io_dt ?? this.io_dt,
      io: io ?? this.io,
      last_stop_dt: last_stop_dt ?? this.last_stop_dt,
      loc_dt: loc_dt ?? this.loc_dt,
      loc: loc ?? this.loc,
      odo: odo ?? this.odo,
      srv_dt: srv_dt ?? this.srv_dt,
      uid_dt: uid_dt ?? this.uid_dt,
      uid: uid ?? this.uid,
      working_time: working_time ?? this.working_time,
    );
  }

  @override
  bool get stringify => true;
  @override
  List<Object?> get props {
    return [
      gps_dt,
      loc,
      srv_dt,
      uid,
    ];
  }
}

@JsonEnum()
enum AssetDetailtype {
  @JsonValue('bigtruck')
  bigtruck,
  @JsonValue('building')
  building,
  @JsonValue('bus')
  bus,
  @JsonValue('commercial vehicle')
  commercialVehicle,
  @JsonValue('light vehicle')
  lightVehicle,
  @JsonValue('lighttruck')
  lighttruck,
  @JsonValue('lou')
  lou,
  @JsonValue('personal vehicle')
  personalVehicle,
  @JsonValue('pickup')
  pickup,
  @JsonValue('remorque_frigo')
  remorqueFrigo,
  @JsonValue('truck')
  truck,
  @JsonValue('warehouse')
  warehouse,
}

@JsonEnum()
enum FuelType {
  @JsonValue('diesel')
  diesel,
  @JsonValue('electric')
  electric,
  @JsonValue('gas')
  gas,
  @JsonValue('gasoline')
  gasoline,
}

@JsonEnum()
enum MeterType {
  @JsonValue('hour')
  hour,
  @JsonValue('km')
  km,
}

@JsonEnum()
enum SensorExtraType {
  @JsonValue('CF')
  cf,
  @JsonValue('SAS')
  sas,
}

//@JsonEnum(alwaysCreate: true)
enum AssetType {
  @JsonValue('BUILDING')
  building,
  @JsonValue('BUS')
  bus,
  @JsonValue('COMMERCIAL_VEHICLE')
  commercial_vehicle,
  @JsonValue('CONCRETE_MIXER')
  concrete_mixer,
  @JsonValue('CONTAINER_TRUCK')
  container_truck,
  @JsonValue('CONTAINER')
  container,
  @JsonValue('DUMP_TRUCK')
  dump_truck,
  @JsonValue('FUEL_TANK_TRUCK')
  fuel_tank_truck,
  @JsonValue('LIGHT_TRUCK')
  light_truck,
  @JsonValue('TANK_TRUCK')
  tank_truck,
  @JsonValue('MOTORCYCLE')
  motorcycle,
  @JsonValue('PERSONAL_VEHICLE')
  personal_vehicle,
  @JsonValue('REFRIGERATED_TRUCK')
  refrigerated_truck,
  @JsonValue('TRAILER_TRUCK')
  trailer_truck,
  @JsonValue('TRUCK')
  truck,
  @JsonValue('UTILITY_TRUCK')
  utility_truck,
  @JsonValue('WAREHOUSE')
  warehouse,
}

@JsonEnum()
enum SensorFamily {
  @JsonValue('ANALOGIC')
  analogic,
  @JsonValue('BINARY')
  binary,
}

@JsonEnum()
enum SensorType {
  @JsonValue('CABINE_STATUS')
  cabineStatus,
  @JsonValue('DOOR_STATUS')
  doorStatus,
  @JsonValue('ENGINE_TEMP')
  engineTemp,
  @JsonValue('FUEL_LEVEL')
  fuelLevel,
  @JsonValue('FUEL_USED')
  fuelUsed,
  @JsonValue('GAS')
  gas,
  @JsonValue('HUMIDITY')
  humidity,
  @JsonValue('MISSION_STATUS')
  missionStatus,
  @JsonValue('ODOMETER')
  odometer,
  @JsonValue('OIL_STATUS')
  oilStatus,
  @JsonValue('PRESSURE')
  pressure,
  @JsonValue('REFRIGERATION_STATUS')
  refrigerationStatus,
  @JsonValue('RPM')
  rpm,
  @JsonValue('SPINNING_STATUS')
  spinningStatus,
  @JsonValue('TAXI_STATUS')
  taxiStatus,
  @JsonValue('TEMPERATURE')
  temperature,
}

enum SensorBinaryType {
  @JsonValue('CABINE_STATUS')
  cabineStatus,
  @JsonValue('DOOR_STATUS')
  doorStatus,
  @JsonValue('MISSION_STATUS')
  missionStatus,
  @JsonValue('OIL_STATUS')
  oilStatus,
  @JsonValue('REFRIGERATION_STATUS')
  refrigerationStatus,
  @JsonValue('SPINNING_STATUS')
  spinningStatus,
  @JsonValue('TAXI_STATUS')
  taxiStatus,
}

enum SensorAnalogicType {
  @JsonValue('ENGINE_TEMP')
  engineTemp,
  @JsonValue('FUEL_LEVEL')
  fuelLevel,
  @JsonValue('FUEL_USED')
  fuelUsed,
  @JsonValue('GAS')
  gas,
  @JsonValue('HUMIDITY')
  humidity,
  @JsonValue('ODOMETER')
  odometer,
  @JsonValue('PRESSURE')
  pressure,
  @JsonValue('RPM')
  rpm,
  @JsonValue('TEMPERATURE')
  temperature,
}

enum Unit {
  @JsonValue('Km')
  km,
  @JsonValue('L')
  L,
  @JsonValue('Rpm')
  rpm,
  @JsonValue('°C')
  C,
  @JsonValue(' ')
  empty,
  @JsonValue('V')
  V,
  @JsonValue('Km/h')
  kmH,
  @JsonValue('UNIT')
  unit,
  @JsonValue('Kg')
  kg,
  @JsonValue('%')
  percent,
}
