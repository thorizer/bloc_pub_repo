// ignore_for_file: public_member_api_docs, non_constant_identifier_names, lines_longer_than_80_chars
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';

part 'fleet.g.dart';

/// {@template Fleet}
/// A Fleet list.
///
/// Contains a [success], [total_count] , [page_count] and [result],
///
/// [result]s are immutable and can be copied using [copyWith], in addition to
/// being serialized and deserialized using [toJson] and [fromJson]
/// respectively.
/// {@endtemplate}

@immutable
@JsonSerializable(explicitToJson: true)
class FleetQuery extends Equatable {
  const FleetQuery({
    this.page_count,
    this.result = const [],
    this.success = false,
    this.total_count = 0,
  });

  final bool success;
  final List<Fleet> result;
  final int? page_count;
  final int? total_count;

  @override
  List<Object?> get props => [result, total_count, page_count, success];

  /// Deserializes the given [JsonMap] into a [FleetQuery].
  static FleetQuery fromJson(JsonMap json) => _$FleetQueryFromJson(json);

  /// Converts this [FleetQuery] into a [JsonMap].
  JsonMap toJson() => _$FleetQueryToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class Fleet extends Equatable {
  const Fleet({
    this.assets,
    this.company_owner,
    required this.id,
    this.name,
  });


  @JsonKey(name: '_assets')
  final List<String>? assets;
  @JsonKey(name: '_company_owner')
  final FleetCompany? company_owner;
  final String? name;
  @JsonKey(name: '_id')
  final String id;

  @override
  String toString() => 'id: $id, name: $name,  company_Id: ${company_owner?.id}, company_name: ${company_owner?.name}';

  @override
  List<Object?> get props {
    return [
      id,
    ];
  }

  /// Deserializes the given [JsonMap] into a [Fleet].
  static Fleet fromJson(JsonMap json) => _$FleetFromJson(json);

  /// Converts this [Fleet] into a [JsonMap].
  JsonMap toJson() => _$FleetToJson(this);

  Fleet copyWith({
    List<String>? assets,
    FleetCompany? company_owner,
    String? name,
    String? id,
  }) {
    return Fleet(
      assets: assets ?? this.assets,
      company_owner: company_owner ?? this.company_owner,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }
}


@immutable
@JsonSerializable(explicitToJson: true)
class FleetCompany extends Equatable {
  const FleetCompany({
    this.id,
    this.name,
  });


  final String? name;
  @JsonKey(name: '_id')
  final String? id;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
    ];
  }

  /// Deserializes the given [JsonMap] into a [FleetCompany].
  static FleetCompany fromJson(JsonMap json) => _$FleetCompanyFromJson(json);

  /// Converts this [FleetCompany] into a [JsonMap].
  JsonMap toJson() => _$FleetCompanyToJson(this);

  FleetCompany copyWith({
    String? name,
    String? id,
  }) {
    return FleetCompany(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }
}