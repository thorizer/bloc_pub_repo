import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';

part 'benomad.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class Benomad extends Equatable {
  Benomad({
    this.bnd,
  });

  final Bnd? bnd;

  /// Deserializes the given [JsonMap] into a [Benomad].
  static Benomad fromJson(JsonMap json) => _$BenomadFromJson(json);

  /// Converts this [Benomad] into a [JsonMap].
  JsonMap toJson() => _$BenomadToJson(this);

  @override
  List<Object?> get props => [bnd?.batchresults.length];

  Benomad copyWith({
    Bnd? bnd,
  }) {
    return Benomad(
      bnd: bnd ?? this.bnd,
    );
  }
}

@immutable
@JsonSerializable(explicitToJson: true)
class Bnd {
  Bnd({
    this.action,
    this.version,
    this.batchresults = const [],
  });

  final String? action;
  final String? version;
  final List<BatchResult> batchresults;

  /// Deserializes the given [JsonMap] into a [Bnd].
  static Bnd fromJson(JsonMap json) => _$BndFromJson(json);

  /// Converts this [Bnd] into a [JsonMap].
  JsonMap toJson() => _$BndToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class BatchResult {
  BatchResult({
    this.extent,
    this.elements,
  });

  final Map<String, double>? extent;
  final Elements? elements;

  /// Deserializes the given [JsonMap] into a [BatchResult].
  static BatchResult fromJson(JsonMap json) => _$BatchResultFromJson(json);

  /// Converts this [BatchResult] into a [JsonMap].
  JsonMap toJson() => _$BatchResultToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class Elements {
  Elements({
    this.count,
    this.element = const [],
  });

  final int? count;
  final List<Element>? element;

  /// Deserializes the given [JsonMap] into a [Elements].
  static Elements fromJson(JsonMap json) => _$ElementsFromJson(json);

  /// Converts this [Elements] into a [JsonMap].
  JsonMap toJson() => _$ElementsToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class Element {
  Element({
    this.coordinate,
    this.postaladdress,
    this.angle,
    this.speedlimit,
    this.relevancescore,
    this.types = const [],
  });

  final Coordinate? coordinate;
  final PostalAddress? postaladdress;
  final double? angle;
  final double? speedlimit;
  final double? relevancescore;
  final List<Type>? types;

  /// Deserializes the given [JsonMap] into a [Element].
  static Element fromJson(JsonMap json) => _$ElementFromJson(json);

  /// Converts this [Element] into a [JsonMap].
  JsonMap toJson() => _$ElementToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class Coordinate {
  Coordinate({
    this.x,
    this.y,
    this.distancefromrequest,
    this.lengthunity,
  });

  final double? x;
  final double? y;
  final double? distancefromrequest;
  final String? lengthunity;

  /// Deserializes the given [JsonMap] into a [Coordinate].
  static Coordinate fromJson(JsonMap json) => _$CoordinateFromJson(json);

  /// Converts this [Coordinate] into a [JsonMap].
  JsonMap toJson() => _$CoordinateToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class PostalAddress {
  PostalAddress({
    this.countrycode,
    this.country,
    this.state,
    this.county,
    this.city,
    this.district,
    this.postalcode,
    this.street,
    this.streetnumber,
    this.classid,
  });

  final String? countrycode;
  final String? country;
  final String? state;
  final String? county;
  final String? city;
  final String? district;
  final String? postalcode;
  final String? street;
  final String? streetnumber;
  final ClassId? classid;

  /// Deserializes the given [JsonMap] into a [PostalAddress].
  static PostalAddress fromJson(JsonMap json) => _$PostalAddressFromJson(json);

  /// Converts this [PostalAddress] into a [JsonMap].
  JsonMap toJson() => _$PostalAddressToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class ClassId {
  ClassId({
    this.code,
    this.id,
  });

  final String? code;
  final String? id;

  /// Deserializes the given [JsonMap] into a [ClassId].
  static ClassId fromJson(JsonMap json) => _$ClassIdFromJson(json);

  /// Converts this [ClassId] into a [JsonMap].
  JsonMap toJson() => _$ClassIdToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class Type {
  Type({
    this.type,
  });

  final String? type;

  /// Deserializes the given [JsonMap] into a [Type].
  static Type fromJson(JsonMap json) => _$TypeFromJson(json);

  /// Converts this [Type] into a [JsonMap].
  JsonMap toJson() => _$TypeToJson(this);
}
