// ignore_for_file: public_member_api_docs, non_constant_identifier_names, constant_identifier_names, lines_longer_than_80_chars

//import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';
import 'package:tuple/tuple.dart';

part 'rt_repo.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class RtRepo extends Equatable {
  /// {@macro RT}
  const RtRepo({
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
    this.status = 'disabled',
    this.uid_dt,
    this.uid,
    this.working_time,
    this.address = '',
    this.addressLocationDate,
    this.driver,
    this.alerts = const <Alert>[],
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
  final String? status;
  final String? uid_dt;
  final String? uid;
  final String address;
  final AddressDateStatus? addressLocationDate;
  final Driver? driver;
  final List<Alert>? alerts;

  String getStatut(Map<String, Object?>? io, String? gps_dt) {
    final gps_date = DateTime.parse(gps_dt ?? '2020-01-01');
    //now
    final now = DateTime.now();
    final dateLessThanThreeDays = now.subtract(const Duration(days: 3));
    final validGpsDate = (gps_date.isAfter(dateLessThanThreeDays));
    if (io?['spd'] != null &&
        io?['con'] != null &&
        io?['spd'] is num &&
        io?['con'] is num) {
      if (io!['con'] == 1 && io['spd']! as num > 0 && validGpsDate) {
        return 'drive';
      } else if (io['con'] == 1 && io['spd']! as num == 0 && validGpsDate) {
        return 'idle';
      } else if (io['con'] == 0 && validGpsDate) {
        return 'stop';
      }
    }
    return 'disabled';
  }

  bool IsStatusActive(String status, String filterStatusGYRB) {
    if (status == 'disabled' && filterStatusGYRB[3] == '0') {
      return false;
    }
    if (status == 'stop' && filterStatusGYRB[2] == '0') {
      return false;
    }
    if (status == 'idle' && filterStatusGYRB[1] == '0') {
      return false;
    }
    if (status == 'drive' && filterStatusGYRB[0] == '0') {
      return false;
    }
    return true;
  }

  List<Asset> SortByStatus(
      List<Asset> AssetList, Map<String, RtRepo?> RealtimeData) {
    final Map<String, String> assetStatusCompare = {
      'drive': 'a',
      'idle': 'b',
      'stop': 'c',
      'disabled': 'd',
    };
    //sort asset by realtime status drive then idle then stop then disabled
    final List<Asset> fleetAssetsSortedByStatus = List.from(AssetList)
      ..sort((a, b) {
        final aStatus =
            assetStatusCompare[RealtimeData[a.id]?.status ?? 'disabled'];
        final bStatus =
            assetStatusCompare[RealtimeData[b.id]?.status ?? 'disabled'];
        return aStatus!.compareTo(bStatus!);
      });
    return fleetAssetsSortedByStatus;
  }

  // getSensorRealValue
  Tuple3<num?, num?, String> getSensorRealValueDt(
      Sensor sensor, Map<String, Object?>? io, RtRepo? rt) {
    num? realValue = null;
    num? altValue = null;
    String valueDate = '';
    final src = sensor.src?.split('.') ?? [];
    final gaps = sensor.gaps;
    final maxSrc = sensor.maxSrc;
    final minSrc = sensor.minSrc;
    final max = sensor.max;
    final min = sensor.min;

    final String srcType = src.isNotEmpty ? src.last : '';

    if (srcType.isNotEmpty) {
      realValue = io?[srcType] as num? ?? null;

      valueDate = io?[srcType + '_dt'] as String? ?? '';
    } else {
      realValue = null;
      valueDate = '';
    }

    if (sensor.src != null &&
        maxSrc != null &&
        minSrc != null &&
        max != null &&
        min != null &&
        srcType != '' &&
        io != null &&
        realValue != null) {
      if (maxSrc.isFinite &&
          minSrc.isFinite &&
          max.isFinite &&
          min.isFinite &&
          maxSrc - minSrc != 0) {
        realValue =
            ((realValue - minSrc) * (max - min)) / (maxSrc - minSrc) + min;
      }
    }

    if (sensor.type == SensorType.odometer && realValue == null) {
      final odoTotal = io?['ODO_TOTAL'] as num? ?? null;
      final odoTrip = rt?.odo ?? null;
      if (odoTotal != null) {
        realValue = odoTotal;
      } else if (odoTrip != null) {
        realValue = odoTrip;
      } else
        realValue = null;
    }
    if (sensor.type == SensorType.fuelLevel) {
      if (srcType == 'CAN_FLL_L') {
        realValue = io?[srcType] as num? ?? null;
      }
      /* if (srcType == 'ana1_fuel') {
        realValue = io?[srcType] as num? ?? null;
      } */

      if (max != null && min != null && realValue != null) {
        altValue = ((realValue - min) * 100) / (max - min);
        //if (srcType == 'ana1_fuel') altValue = ((realValue / max) * 100);
      }
    }

    if (gaps != null && gaps.isNotEmpty) {
      for (final gap in gaps) {
        final minSrcGap = gap.minSrcGap;
        final maxSrcGap = gap.maxSrcGap;
        final gapValue = gap.gapValue;
        if ((gapValue != null && gapValue.isFinite && realValue != null) &&
            ((minSrcGap != null && realValue >= minSrcGap) ||
                minSrcGap == null) &&
            ((maxSrcGap != null && realValue <= maxSrcGap) ||
                maxSrcGap == null)) {
          realValue = realValue + gapValue;
          break;
        }
      }
    }
    return Tuple3(realValue, altValue, valueDate);
  }

  /// Deserializes the given [JsonMap] into a [RtRepo].
  static RtRepo fromJson(JsonMap json) => _$RtRepoFromJson(json);

  /// Converts this [RtRepo] into a [JsonMap].
  JsonMap toJson() => _$RtRepoToJson(this);

  /// Returns a copy of this Io with the given values updated.
  ///
  /// {@macro Io}
  RtRepo copyWith({
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
    String? status,
    String? address,
    AddressDateStatus? addressLocationDate,
    Driver? driver,
    List<Alert>? alerts,
  }) {
    return RtRepo(
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
      status: status ?? this.status,
      address: address ?? this.address,
      addressLocationDate: addressLocationDate ?? this.addressLocationDate,
      driver: driver ?? this.driver,
      alerts: alerts ?? this.alerts,
    );
  }

  @override
  String toString() =>
      'RtRepo(CANBUSDATA_dt: $CANBUSDATA_dt, CANBUSDATA: $CANBUSDATA, consL_Km: $consL_Km, gps_dt: $gps_dt, io_dt: $io_dt, io: $io, last_stop_dt: $last_stop_dt, loc_dt: $loc_dt, loc: $loc, odo: $odo, srv_dt: $srv_dt, uid_dt: $uid_dt, uid: $uid, working_time: $working_time, status: $status, address: $address, addressLocationDate: $addressLocationDate, driver: $driver, alerts: $alerts)';

  @override
  List<Object?> get props {
    return [
      gps_dt,
      loc?.coordinates,
      srv_dt,
      uid,
      driver?.id,
      alerts?.length,
    ];
  }
}

enum AddressDateStatus {
  @JsonValue('recent')
  recent,
  @JsonValue('outdated')
  outdated,
}
