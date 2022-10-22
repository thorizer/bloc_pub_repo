// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginRepo _$UserLoginRepoFromJson(Map<String, dynamic> json) =>
    UserLoginRepo(
      success: json['success'] as bool?,
      token: json['token'] as String?,
      expirationDate: json['expirationDate'] as String?,
      user: json['user'] == null
          ? null
          : UserRepo.fromJson(json['user'] as Map<String, dynamic>),
      company_owner: json['company_owner'] == null
          ? null
          : CompanyOwnerRepo.fromJson(
              json['company_owner'] as Map<String, dynamic>),
      role: json['role'] == null
          ? null
          : RoleRepo.fromJson(json['role'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserLoginRepoToJson(UserLoginRepo instance) =>
    <String, dynamic>{
      'success': instance.success,
      'token': instance.token,
      'expirationDate': instance.expirationDate,
      'user': instance.user?.toJson(),
      'company_owner': instance.company_owner?.toJson(),
      'role': instance.role?.toJson(),
    };
