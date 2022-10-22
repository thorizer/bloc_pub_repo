// ignore_for_file: public_member_api_docs, non_constant_identifier_names, constant_identifier_names, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';

part 'user.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class UserQuery extends Equatable {
  const UserQuery({
    this.page_count,
    this.result = const [],
    this.success = false,
    this.total_count = 0,
  });

  final bool? success;
  final int? page_count;
  final int? total_count;
  final List<User> result;

  @override
  List<Object?> get props => [result, total_count, page_count, success];

  /// Deserializes the given [JsonMap] into a [UserQuery].
  static UserQuery fromJson(JsonMap json) => _$UserQueryFromJson(json);

  /// Converts this [UserQuery] into a [JsonMap].
  JsonMap toJson() => _$UserQueryToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class User extends Equatable {
  const User({
    this.alertModel,
    this.alertType,
    this.asset,
    this.asset_groupe,
    this.authentication_type,
    this.company_owner,
    this.contact,
    this.creation_dt,
    this.ctry,
    this.expiration_dt,
    this.first_name,
    this.geoDataType,
    required this.id,
    this.last_name,
    this.login,
    this.module,
    this.private,
    this.reports,
    this.role,
    this.status,
  });

  final bool? private;
  @JsonKey(name: '_alertModel')
  final List<String>? alertModel;
  @JsonKey(name: '_alertType')
  final List<String>? alertType;
  @JsonKey(name: '_asset')
  final List<String>? asset;
  @JsonKey(name: '_asset_groupe')
  final List<String>? asset_groupe;
  @JsonKey(name: '_geoDataType')
  final List<String>? geoDataType;
  @JsonKey(name: '_module')
  final List<String>? module;
  @JsonKey(name: '_reports')
  final List<String>? reports;
  final String? authentication_type;
  @JsonKey(name: '_company_owner')
  final String? company_owner;
  final String? creation_dt;
  @JsonKey(name: '_ctry')
  final String? ctry;
  final String? expiration_dt;
  final String? first_name;
  @JsonKey(name: '_id')
  final String id;
  final String? last_name;
  final String? login;
  final String? status;
  final UserContact? contact;
  @JsonKey(name: '_role')
  final String? role;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      private,
      alertModel,
      alertType,
      asset,
      asset_groupe,
      geoDataType,
      module,
      reports,
      authentication_type,
      company_owner,
      creation_dt,
      ctry,
      expiration_dt,
      first_name,
      id,
      last_name,
      login,
      status,
      contact,
      role,
    ];
  }

  /// Deserializes the given [JsonMap] into a [User].
  static User fromJson(JsonMap json) => _$UserFromJson(json);

  /// Converts this [User] into a [JsonMap].
  JsonMap toJson() => _$UserToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class UserContact extends Equatable {
  const UserContact({
    this.fax,
    this.mail,
    this.phone,
  });

  final String? fax;
  final String? mail;
  final String? phone;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [fax, mail, phone];

  /// Deserializes the given [JsonMap] into a [UserContact].
  static UserContact fromJson(JsonMap json) => _$UserContactFromJson(json);

  /// Converts this [UserContact] into a [JsonMap].
  JsonMap toJson() => _$UserContactToJson(this);
}

class UserParams {
  UserParams({
    this.dashboard,
    this.viewsConfig,
  });

  final List<UserDashboard>? dashboard;
  final Map<String, bool>? viewsConfig;
}

class UserDashboard {
  UserDashboard({
    this.col,
    this.config,
    this.field,
    this.id,
    this.input,
    this.name,
    this.row,
    this.sizeX,
    this.sizeY,
    this.type,
  });

  final dynamic config;
  final UserField? field;
  final int? col;
  final int? id;
  final int? row;
  final int? sizeX;
  final int? sizeY;
  final String? input;
  final String? name;
  final String? type;
}

class UserField {
  UserField({
    this.asset,
    this.assetName,
    this.gpsDt,
    this.name,
    this.src,
    this.srvDt,
    this.value,
    this.valueType,
  });

  final double? value;
  final String? asset;
  final String? assetName;
  final String? gpsDt;
  final String? name;
  final String? src;
  final String? srvDt;
  final String? valueType;
}
