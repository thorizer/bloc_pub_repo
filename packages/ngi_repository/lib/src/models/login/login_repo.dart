// ignore_for_file: public_member_api_docs, non_constant_identifier_names, constant_identifier_names, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_repository/ngi_repository.dart';

part 'login_repo.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class UserLoginRepo extends Equatable {
  const UserLoginRepo({
    this.success,
    this.token,
    this.expirationDate,
    this.user,
    this.company_owner,
    this.role,
  });

  final bool? success;
  final String? token;
  final String? expirationDate;
  final UserRepo? user;
  final CompanyOwnerRepo? company_owner;
  final RoleRepo? role;

  @override
  List<Object?> get props =>
      [success, token, expirationDate, user, company_owner, role];

  @override
  bool get stringify => true;

  /// Deserializes the given [JsonMap] into a [UserLoginRepo].
  static UserLoginRepo fromJson(JsonMap json) => _$UserLoginRepoFromJson(json);

  /// Converts this [UserLoginRepo] into a [JsonMap].
  JsonMap toJson() => _$UserLoginRepoToJson(this);

  UserLoginRepo copyWith({
    bool? success,
    String? token,
    String? expirationDate,
    UserRepo? user,
    CompanyOwnerRepo? company_owner,
    RoleRepo? role,
  }) {
    return UserLoginRepo(
      success: success ?? this.success,
      token: token ?? this.token,
      expirationDate: expirationDate ?? this.expirationDate,
      user: user ?? this.user,
      company_owner: company_owner ?? this.company_owner,
      role: role ?? this.role,
    );
  }
}
