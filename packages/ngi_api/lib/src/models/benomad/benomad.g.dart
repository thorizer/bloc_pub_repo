// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_alpha, lint_beta, implicit_dynamic_parameter

part of 'benomad.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Benomad _$BenomadFromJson(Map<String, dynamic> json) => Benomad(
      bnd: json['bnd'] == null
          ? null
          : Bnd.fromJson(json['bnd'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BenomadToJson(Benomad instance) => <String, dynamic>{
      'bnd': instance.bnd?.toJson(),
    };

Bnd _$BndFromJson(Map<String, dynamic> json) => Bnd(
      action: json['action'] as String?,
      version: json['version'] as String?,
      batchresults: (json['batchresults'] as List<dynamic>?)
              ?.map((e) => BatchResult.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$BndToJson(Bnd instance) => <String, dynamic>{
      'action': instance.action,
      'version': instance.version,
      'batchresults': instance.batchresults.map((e) => e.toJson()).toList(),
    };

BatchResult _$BatchResultFromJson(Map<String, dynamic> json) => BatchResult(
      extent: (json['extent'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
      elements: json['elements'] == null
          ? null
          : Elements.fromJson(json['elements'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BatchResultToJson(BatchResult instance) =>
    <String, dynamic>{
      'extent': instance.extent,
      'elements': instance.elements?.toJson(),
    };

Elements _$ElementsFromJson(Map<String, dynamic> json) => Elements(
      count: json['count'] as int?,
      element: (json['element'] as List<dynamic>?)
              ?.map((e) => Element.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ElementsToJson(Elements instance) => <String, dynamic>{
      'count': instance.count,
      'element': instance.element?.map((e) => e.toJson()).toList(),
    };

Element _$ElementFromJson(Map<String, dynamic> json) => Element(
      coordinate: json['coordinate'] == null
          ? null
          : Coordinate.fromJson(json['coordinate'] as Map<String, dynamic>),
      postaladdress: json['postaladdress'] == null
          ? null
          : PostalAddress.fromJson(
              json['postaladdress'] as Map<String, dynamic>),
      angle: (json['angle'] as num?)?.toDouble(),
      speedlimit: (json['speedlimit'] as num?)?.toDouble(),
      relevancescore: (json['relevancescore'] as num?)?.toDouble(),
      types: (json['types'] as List<dynamic>?)
              ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ElementToJson(Element instance) => <String, dynamic>{
      'coordinate': instance.coordinate?.toJson(),
      'postaladdress': instance.postaladdress?.toJson(),
      'angle': instance.angle,
      'speedlimit': instance.speedlimit,
      'relevancescore': instance.relevancescore,
      'types': instance.types?.map((e) => e.toJson()).toList(),
    };

Coordinate _$CoordinateFromJson(Map<String, dynamic> json) => Coordinate(
      x: (json['x'] as num?)?.toDouble(),
      y: (json['y'] as num?)?.toDouble(),
      distancefromrequest: (json['distancefromrequest'] as num?)?.toDouble(),
      lengthunity: json['lengthunity'] as String?,
    );

Map<String, dynamic> _$CoordinateToJson(Coordinate instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'distancefromrequest': instance.distancefromrequest,
      'lengthunity': instance.lengthunity,
    };

PostalAddress _$PostalAddressFromJson(Map<String, dynamic> json) =>
    PostalAddress(
      countrycode: json['countrycode'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      county: json['county'] as String?,
      city: json['city'] as String?,
      district: json['district'] as String?,
      postalcode: json['postalcode'] as String?,
      street: json['street'] as String?,
      streetnumber: json['streetnumber'] as String?,
      classid: json['classid'] == null
          ? null
          : ClassId.fromJson(json['classid'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostalAddressToJson(PostalAddress instance) =>
    <String, dynamic>{
      'countrycode': instance.countrycode,
      'country': instance.country,
      'state': instance.state,
      'county': instance.county,
      'city': instance.city,
      'district': instance.district,
      'postalcode': instance.postalcode,
      'street': instance.street,
      'streetnumber': instance.streetnumber,
      'classid': instance.classid?.toJson(),
    };

ClassId _$ClassIdFromJson(Map<String, dynamic> json) => ClassId(
      code: json['code'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ClassIdToJson(ClassId instance) => <String, dynamic>{
      'code': instance.code,
      'id': instance.id,
    };

Type _$TypeFromJson(Map<String, dynamic> json) => Type(
      type: json['type'] as String?,
    );

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
      'type': instance.type,
    };
