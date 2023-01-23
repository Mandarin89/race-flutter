import 'package:json_annotation/json_annotation.dart';

part 'accounts.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Accounts {
  final List<Account> accounts;

  Accounts({required this.accounts});

  factory Accounts.fromJson(Map<String, dynamic> json) =>
      _$AccountsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountsToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Account {
  final int id;
  final String name;
  final CompanyLogo? companyLogo;

  Account({required this.id, required this.name, required this.companyLogo});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CompanyLogo {
  final int? id;
  final bool? isValid;
  final String? created;
  String? file;
  final String? name;
  final String? title;

  CompanyLogo(
      {this.id, this.isValid, this.created, this.file, this.name, this.title});

  factory CompanyLogo.fromJson(Map<String, dynamic> json) =>
      _$CompanyLogoFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyLogoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Mfa {
  final bool? mfaRequired;
  final String? mfaType;

  Mfa({this.mfaRequired, this.mfaType});

  factory Mfa.fromJson(Map<String, dynamic> json) =>
      _$MfaFromJson(json);

  Map<String, dynamic> toJson() => _$MfaToJson(this);
}
