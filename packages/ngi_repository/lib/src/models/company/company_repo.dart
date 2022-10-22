// ignore_for_file: public_member_api_docs, non_constant_identifier_names, constant_identifier_names, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:ngi_api/ngi_api.export.dart';

part 'company_repo.g.dart';

@immutable
@JsonSerializable(explicitToJson: true)
class CompanyOwnerRepo extends Equatable {
  const CompanyOwnerRepo({
    required this.id,
    this.client_code,
    this.company_owner,
    this.ctry,
    this.currency,
    this.name,
    this.fax,
    this.phone,
    this.mail,
    this.fraudRate,
    this.tank_over,
    this.tank_under,
    this.tank_threshold,
    this.totalUsername,
    this.totalPassword,
    this.totalCheckAccess,
  });

  final String id;
  final String? client_code;
  final String? company_owner;
  final String? ctry;
  final String? currency;
  final String? name;
  final String? fax;
  final String? phone;
  final String? mail;
  final int? fraudRate;
  final int? tank_over;
  final int? tank_under;
  final int? tank_threshold;
  final String? totalUsername;
  final String? totalPassword;
  final bool? totalCheckAccess;

  @override
  String toString() =>
      'AssetState(name:${name}  id: ${id}, country: $ctry)';

  @override
  List<Object?> get props {
    return [
      id,
    ];
  }

  /// Deserializes the given [JsonMap] into a [CompanyOwnerRepo].
  static CompanyOwnerRepo fromJson(JsonMap json) =>
      _$CompanyOwnerRepoFromJson(json);

  /// Converts this [CompanyOwnerRepo] into a [JsonMap].
  JsonMap toJson() => _$CompanyOwnerRepoToJson(this);

  CompanyOwnerRepo copyWith({
    String? id,
    String? client_code,
    String? company_owner,
    String? ctry,
    String? currency,
    String? name,
    String? fax,
    String? phone,
    String? mail,
    int? fraudRate,
    int? tank_over,
    int? tank_under,
    int? tank_threshold,
    String? totalUsername,
    String? totalPassword,
    bool? totalCheckAccess,
  }) {
    return CompanyOwnerRepo(
      id: id ?? this.id,
      client_code: client_code ?? this.client_code,
      company_owner: company_owner ?? this.company_owner,
      ctry: ctry ?? this.ctry,
      currency: currency ?? this.currency,
      name: name ?? this.name,
      fax: fax ?? this.fax,
      phone: phone ?? this.phone,
      mail: mail ?? this.mail,
      fraudRate: fraudRate ?? this.fraudRate,
      tank_over: tank_over ?? this.tank_over,
      tank_under: tank_under ?? this.tank_under,
      tank_threshold: tank_threshold ?? this.tank_threshold,
      totalUsername: totalUsername ?? this.totalUsername,
      totalPassword: totalPassword ?? this.totalPassword,
      totalCheckAccess: totalCheckAccess ?? this.totalCheckAccess,
    );
  }

  Map<String, Object?> toMap() {
    final map = <String, Object?>{};

    map['id'] = id;
    map['client_code'] = client_code;
    map['company_owner'] = company_owner;
    map['ctry'] = ctry;
    map['currency'] = currency;
    map['name'] = name;
    map['fax'] = fax;
    map['phone'] = phone;
    map['mail'] = mail;
    map['fraudRate'] = fraudRate;
    map['tank_over'] = tank_over;
    map['tank_under'] = tank_under;
    map['tank_threshold'] = tank_threshold;
    map['totalUsername'] = totalUsername;
    map['totalPassword'] = totalPassword;
    map['totalCheckAccess'] = totalCheckAccess;
    return map;
  }
}
