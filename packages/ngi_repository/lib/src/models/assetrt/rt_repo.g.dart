// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rt_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RtRepo _$RtRepoFromJson(Map<String, dynamic> json) => RtRepo(
      CANBUSDATA_dt: json['CANBUSDATA_dt'] as String?,
      CANBUSDATA: json['CANBUSDATA'] as Map<String, dynamic>?,
      consL_Km: json['consL_Km'] as String?,
      gps_dt: json['gps_dt'] as String?,
      io_dt: json['io_dt'] as String?,
      io: json['io'] as Map<String, dynamic>?,
      last_stop_dt: json['last_stop_dt'] as String?,
      loc_dt: json['loc_dt'] as String?,
      loc: json['loc'] == null
          ? null
          : Loc.fromJson(json['loc'] as Map<String, dynamic>),
      odo: (json['odo'] as num?)?.toDouble(),
      srv_dt: json['srv_dt'] as String?,
      status: json['status'] as String?,
      uid_dt: json['uid_dt'] as String?,
      uid: json['uid'] as String?,
      working_time: json['working_time'] as num?,
    );

Map<String, dynamic> _$RtRepoToJson(RtRepo instance) => <String, dynamic>{
      'odo': instance.odo,
      'loc': instance.loc?.toJson(),
      'CANBUSDATA': instance.CANBUSDATA,
      'io': instance.io,
      'working_time': instance.working_time,
      'CANBUSDATA_dt': instance.CANBUSDATA_dt,
      'consL_Km': instance.consL_Km,
      'gps_dt': instance.gps_dt,
      'io_dt': instance.io_dt,
      'last_stop_dt': instance.last_stop_dt,
      'loc_dt': instance.loc_dt,
      'srv_dt': instance.srv_dt,
      'status': instance.status,
      'uid_dt': instance.uid_dt,
      'uid': instance.uid,
    };
