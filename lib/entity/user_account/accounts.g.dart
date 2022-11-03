// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Accounts _$AccountsFromJson(Map<String, dynamic> json) => Accounts(
      accounts: (json['accounts'] as List<dynamic>)
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountsToJson(Accounts instance) => <String, dynamic>{
      'accounts': instance.accounts,
    };

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as int,
      name: json['name'] as String,
      companyLogo: json['company_logo'] == null
          ? null
          : CompanyLogo.fromJson(json['company_logo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'company_logo': instance.companyLogo,
    };

CompanyLogo _$CompanyLogoFromJson(Map<String, dynamic> json) => CompanyLogo(
      id: json['id'] as int?,
      isValid: json['is_valid'] as bool?,
      created: json['created'] as String?,
      file: json['file'] as String?,
      name: json['name'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$CompanyLogoToJson(CompanyLogo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_valid': instance.isValid,
      'created': instance.created,
      'file': instance.file,
      'name': instance.name,
      'title': instance.title,
    };

Mfa _$MfaFromJson(Map<String, dynamic> json) => Mfa(
      mfaRequired: json['mfa_required'] as bool?,
      mfaType: json['mfa_type'] as String?,
    );

Map<String, dynamic> _$MfaToJson(Mfa instance) => <String, dynamic>{
      'mfa_required': instance.mfaRequired,
      'mfa_type': instance.mfaType,
    };
