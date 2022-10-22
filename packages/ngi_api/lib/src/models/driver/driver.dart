// ignore_for_file: public_member_api_docs, non_constant_identifier_names, lines_longer_than_80_chars, comment_references
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';

part 'driver.g.dart';

/// {@template DRIVER}
/// A Driver list.
///
/// Contains a [success], [total_count] , [page_count] and [result],
///
/// [result]s are immutable and can be copied using [CopyWith], in addition to
/// being serialized and deserialized using [toJson] and [fromJson]
/// respectively.
/// {@endtemplate}

@immutable
@JsonSerializable(explicitToJson: true)
class DriverQuery extends Equatable {
  const DriverQuery({
    this.page_count,
    this.result = const [],
    this.success = false,
    this.total_count = 0,
  });

  final bool success;
  final List<Driver> result;
  final int? page_count;
  final int? total_count;

  @override
  List<Object?> get props => [result, total_count, page_count, success];

  /// Deserializes the given [JsonMap] into a [DriverQuery].
  static DriverQuery fromJson(JsonMap json) => _$DriverQueryFromJson(json);

  /// Converts this [DriverQuery] into a [JsonMap].
  JsonMap toJson() => _$DriverQueryToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class Driver extends Equatable {
  const Driver({
    this.asset,
    this.attributes,
    this.company_owner,
    this.contact,
    this.creation_dt,
    this.ctry,
    this.first_name,
    required this.id,
    this.identifier,
    this.last_name,
    this.picture,
  });

  final DriverAttributes? attributes;
  final DriverContact? contact;
  @JsonKey(name: '_asset')
  final String? asset;
  @JsonKey(name: '_company_owner')
  final String? company_owner;
  final String? creation_dt;
  @JsonKey(name: '_ctry')
  final String? ctry;
  final String? first_name;
  @JsonKey(name: '_id')
  final String id;
  final String? identifier;
  final String? last_name;
  final String? picture;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      asset,
      attributes,
      company_owner,
      contact,
      creation_dt,
      ctry,
      first_name,
      id,
      identifier,
      last_name,
      picture,
    ];
  }

  /// Deserializes the given [JsonMap] into a [Driver].
  static Driver fromJson(JsonMap json) => _$DriverFromJson(json);

  /// Converts this [Driver] into a [JsonMap].
  JsonMap toJson() => _$DriverToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class DriverAttributes extends Equatable {
  const DriverAttributes({
    this.code_driver,
  });

  final String? code_driver;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [code_driver];

  /// Deserializes the given [JsonMap] into a [DriverAttributes].
  static DriverAttributes fromJson(JsonMap json) => _$DriverAttributesFromJson(json);

  /// Converts this [DriverAttributes] into a [JsonMap].
  JsonMap toJson() => _$DriverAttributesToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class DriverContact extends Equatable {
  const DriverContact({
    this.phone,
    this.address,
    this.mail,
  });

  final String? phone;
  final String? address;
  final String? mail;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [phone, address, mail];

  /// Deserializes the given [JsonMap] into a [DriverContact].
  static DriverContact fromJson(JsonMap json) => _$DriverContactFromJson(json);

  /// Converts this [DriverContact] into a [JsonMap].
  JsonMap toJson() => _$DriverContactToJson(this);
}
