// ignore_for_file: public_member_api_docs, non_constant_identifier_names, constant_identifier_names, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';

part 'user_repo.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class UserRepo extends Equatable {
  const UserRepo({
    required this.id,
    this.company_owner,
    this.fax,
    this.mail,
    this.phone,
    this.ctry,
    this.first_name,
    this.last_name,
    this.login,
    this.role,
  });

  final String? company_owner;
  final String? ctry;
  final String? first_name;
  final String id;
  final String? last_name;
  final String? login;
  final String? fax;
  final String? mail;
  final String? phone;
  final String? role;

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      company_owner,
      ctry,
      first_name,
      id,
      last_name,
      login,
      fax,
      mail,
      phone,
      role,
    ];
  }

  /// Deserializes the given [JsonMap] into a [UserRepo].
  static UserRepo fromJson(JsonMap json) => _$UserRepoFromJson(json);

  /// Converts this [UserRepo] into a [JsonMap].
  JsonMap toJson() => _$UserRepoToJson(this);

  UserRepo copyWith({
    String? company_owner,
    String? ctry,
    String? first_name,
    String? id,
    String? last_name,
    String? login,
    String? fax,
    String? mail,
    String? phone,
    String? role,
  }) {
    return UserRepo(
      company_owner: company_owner ?? this.company_owner,
      ctry: ctry ?? this.ctry,
      first_name: first_name ?? this.first_name,
      id: id ?? this.id,
      last_name: last_name ?? this.last_name,
      login: login ?? this.login,
      fax: fax ?? this.fax,
      mail: mail ?? this.mail,
      phone: phone ?? this.phone,
      role: role ?? this.role,
    );
  }

  Map<String, String?> toMap() {
    final map = <String, String?>{};

    map['id'] = id;
    map['company_owner'] = company_owner;
    map['fax'] = fax;
    map['mail'] = mail;
    map['phone'] = phone;
    map['ctry'] = ctry;
    map['first_name'] = first_name;
    map['last_name'] = last_name;
    map['login'] = login;
    map['role'] = role;

    return map;
  }
}
