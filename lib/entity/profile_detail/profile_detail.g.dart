// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDetail _$ProfileDetailFromJson(Map<String, dynamic> json) =>
    ProfileDetail(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
    )
      ..city = json['city'] as String?
      ..color = json['color'] as String?
      ..headline = json['headline'] as String?
      ..somethingAbout = json['something_about'] as String?
      ..photo = json['photo'] == null
          ? null
          : RaceFile.fromJson(json['photo'] as Map<String, dynamic>)
      ..contacts = (json['contacts'] as List<dynamic>?)
          ?.map((e) => ProfileContact.fromJson(e as Map<String, dynamic>))
          .toList()
      ..country = json['country'] == null
          ? null
          : ProfileCountry.fromJson(json['country'] as Map<String, dynamic>)
      ..education = (json['education'] as List<dynamic>?)
          ?.map((e) => ProfileEducation.fromJson(e as Map<String, dynamic>))
          .toList()
      ..expertise = (json['expertise'] as List<dynamic>?)
          ?.map((e) =>
              ProfileExpertiseLanguage.fromJson(e as Map<String, dynamic>))
          .toList()
      ..languages = (json['languages'] as List<dynamic>?)
          ?.map((e) =>
              ProfileExpertiseLanguage.fromJson(e as Map<String, dynamic>))
          .toList()
      ..workHistory = (json['work_history'] as List<dynamic>?)
          ?.map((e) => ProfileWorkHistory.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ProfileDetailToJson(ProfileDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'city': instance.city,
      'color': instance.color,
      'headline': instance.headline,
      'something_about': instance.somethingAbout,
      'photo': instance.photo,
      'contacts': instance.contacts,
      'country': instance.country,
      'education': instance.education,
      'expertise': instance.expertise,
      'languages': instance.languages,
      'work_history': instance.workHistory,
    };

ProfileContact _$ProfileContactFromJson(Map<String, dynamic> json) =>
    ProfileContact(
      id: json['id'] as int,
    )
      ..value = json['value'] as String?
      ..provider = json['provider'] as Map<String, dynamic>?;

Map<String, dynamic> _$ProfileContactToJson(ProfileContact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'provider': instance.provider,
    };

ProfileCountry _$ProfileCountryFromJson(Map<String, dynamic> json) =>
    ProfileCountry(
      code: json['code'] as String,
      name: json['name'] as String,
    )..flag = json['flag'] as String?;

Map<String, dynamic> _$ProfileCountryToJson(ProfileCountry instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'flag': instance.flag,
    };

ProfileEducation _$ProfileEducationFromJson(Map<String, dynamic> json) =>
    ProfileEducation(
      id: json['id'] as int,
      fromDate: json['from_date'] as String,
      toDate: json['to_date'] as String,
    )
      ..notes = json['notes'] as String?
      ..city = json['city'] as String?
      ..fieldOfStudy = json['field_of_study'] as String?
      ..degree = json['degree'] as String?
      ..schoolName = json['school_name'] as String?;

Map<String, dynamic> _$ProfileEducationToJson(ProfileEducation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
      'notes': instance.notes,
      'city': instance.city,
      'field_of_study': instance.fieldOfStudy,
      'degree': instance.degree,
      'school_name': instance.schoolName,
    };

ProfileExpertiseLanguage _$ProfileExpertiseLanguageFromJson(
        Map<String, dynamic> json) =>
    ProfileExpertiseLanguage(
      proficiency: json['proficiency'] as int,
      proficiencyDisplay: json['proficiency_display'] as String,
      skill: json['skill'] as Map<String, dynamic>?,
    )
      ..language = json['language'] as String?
      ..skillPercents = (json['skill_percents'] as num?)?.toDouble();

Map<String, dynamic> _$ProfileExpertiseLanguageToJson(
        ProfileExpertiseLanguage instance) =>
    <String, dynamic>{
      'proficiency': instance.proficiency,
      'proficiency_display': instance.proficiencyDisplay,
      'skill': instance.skill,
      'language': instance.language,
      'skill_percents': instance.skillPercents,
    };

ProfileWorkHistory _$ProfileWorkHistoryFromJson(Map<String, dynamic> json) =>
    ProfileWorkHistory(
      id: json['id'] as int,
      jobTitle: json['job_title'] as String,
      jobDescription: json['job_description'] as String?,
      companyName: json['company_name'] as String,
      fromDate: json['from_date'] as String,
      toDate: json['to_date'] as String,
    );

Map<String, dynamic> _$ProfileWorkHistoryToJson(ProfileWorkHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'job_title': instance.jobTitle,
      'company_name': instance.companyName,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
      'job_description': instance.jobDescription,
    };
