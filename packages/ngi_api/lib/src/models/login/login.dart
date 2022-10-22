// ignore_for_file: public_member_api_docs, non_constant_identifier_names, constant_identifier_names, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';

part 'login.g.dart';


@immutable
@JsonSerializable(explicitToJson: true)
class UserLoginResult extends Equatable {
  const UserLoginResult({
    this.success,
    this.result,
  });

  final bool? success;
  final LoginResult? result;

  @override
  List<Object?> get props => [success, result];

  @override
  bool get stringify => true;

  /// Deserializes the given [JsonMap] into a [UserLoginResult].
  static UserLoginResult fromJson(JsonMap json) => _$UserLoginResultFromJson(json);

  /// Converts this [UserLoginResult] into a [JsonMap].
  JsonMap toJson() => _$UserLoginResultToJson(this);
}


@immutable
@JsonSerializable(explicitToJson: true)
class LoginResult extends Equatable {
  const LoginResult({
    this.user,
    this.token,
    this.expirationDate,
    this.tokenId,
  });

  final UserLogin? user;
  final String? token;
  final String? expirationDate;
  final String? tokenId;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [user, token, expirationDate, tokenId];

  /// Deserializes the given [JsonMap] into a [LoginResult].
  static LoginResult fromJson(JsonMap json) => _$LoginResultFromJson(json);

  /// Converts this [LoginResult] into a [JsonMap].
  JsonMap toJson() => _$LoginResultToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class UserLogin extends Equatable {
  const UserLogin({
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
  final CompanyOwner? company_owner;
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
  final UserLoginContact? contact;
  @JsonKey(name: '_role')
  final Role? role;

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
      //company_owner,
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

  /// Deserializes the given [JsonMap] into a [UserLogin].
  static UserLogin fromJson(JsonMap json) => _$UserLoginFromJson(json);

  /// Converts this [UserLogin] into a [JsonMap].
  JsonMap toJson() => _$UserLoginToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class UserLoginContact extends Equatable {
  const UserLoginContact({
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

  /// Deserializes the given [JsonMap] into a [UserLoginContact].
  static UserLoginContact fromJson(JsonMap json) =>
      _$UserLoginContactFromJson(json);

  /// Converts this [UserLoginContact] into a [JsonMap].
  JsonMap toJson() => _$UserLoginContactToJson(this);
}

@immutable
@JsonSerializable(explicitToJson: true)
class Role extends Equatable {
  const Role({
    this.childs,
    this.creation_dt,
    this.description,
    this.id,
    this.modif_dt,
    this.module,
    this.permissions,
  });

  @JsonKey(name: '_module')
  final List<String>? module;
  @JsonKey(name: '_childs')
  final List<String>? childs;
  final List<String>? permissions;
  final String? creation_dt;
  final String? description;
  @JsonKey(name: '_id')
  final String? id;
  final String? modif_dt;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      module,
      childs,
      permissions,
      creation_dt,
      description,
      id,
      modif_dt,
    ];
  }

  /// Deserializes the given [JsonMap] into a [Role].
  static Role fromJson(JsonMap json) => _$RoleFromJson(json);

  /// Converts this [Role] into a [JsonMap].
  JsonMap toJson() => _$RoleToJson(this);
}
