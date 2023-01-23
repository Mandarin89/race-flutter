import 'package:json_annotation/json_annotation.dart';
import 'package:race/entity/common/race_file.dart';

part 'profile_detail.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileDetail {
  int id;
  String firstName;
  String lastName;
  String? city;
  String? color;
  String? headline;
  String? somethingAbout;
  RaceFile? photo;
  List<ProfileContact>? contacts;
  ProfileCountry? country;
  List<ProfileEducation>? education;
  List<ProfileExpertiseLanguage>? expertise;
  List<ProfileExpertiseLanguage>? languages;
  List<ProfileWorkHistory>? workHistory;

  ProfileDetail(
      {required this.id, required this.firstName, required this.lastName});

  factory ProfileDetail.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDetailToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileContact {
  int id;
  String? value;
  Map<String, dynamic>? provider;

  ProfileContact({required this.id});

  factory ProfileContact.fromJson(Map<String, dynamic> json) =>
      _$ProfileContactFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileContactToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileCountry {
  String code;
  String name;
  String? flag;

  ProfileCountry({required this.code, required this.name});

    factory ProfileCountry.fromJson(Map<String, dynamic> json) =>
      _$ProfileCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileCountryToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileEducation {
  int id;
  String fromDate;
  String toDate;
  String? notes;
  String? city;
  String? fieldOfStudy;
  String? degree;
  String? schoolName;

  ProfileEducation(
      {required this.id, required this.fromDate, required this.toDate});

  factory ProfileEducation.fromJson(Map<String, dynamic> json) =>
      _$ProfileEducationFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileEducationToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileExpertiseLanguage {
  int proficiency;
  String proficiencyDisplay;
  Map<String, dynamic>? skill;
  String? language;
  double? skillPercents;

  ProfileExpertiseLanguage(
      {required this.proficiency,
      required this.proficiencyDisplay,
      required this.skill});

  factory ProfileExpertiseLanguage.fromJson(Map<String, dynamic> json) =>
      _$ProfileExpertiseLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileExpertiseLanguageToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class ProfileWorkHistory {
  int id;
  String jobTitle;
  String companyName;
  String fromDate;
  String toDate;
  String? jobDescription;

  ProfileWorkHistory(
      {required this.id,
      required this.jobTitle,
      required this.jobDescription,
      required this.companyName,
      required this.fromDate,
      required this.toDate});

  factory ProfileWorkHistory.fromJson(Map<String, dynamic> json) =>
      _$ProfileWorkHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileWorkHistoryToJson(this);
}
