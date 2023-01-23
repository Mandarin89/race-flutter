// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as int,
    )
      ..email = json['email'] as String?
      ..effectiveLanguage = json['effective_language'] as String?
      ..emailSubscribed = json['email_subscribed'] as bool?
      ..profile = json['profile'] == null
          ? null
          : Lines.fromJson(json['profile'] as Map<String, dynamic>)
      ..isActive = json['is_active'] as bool?
      ..whenJoined = json['when_joined'] as String?
      ..lastLogin = json['last_login'] as String?
      ..groups = (json['groups'] as List<dynamic>?)
          ?.map((e) => RaceUserGroup.fromJson(e as Map<String, dynamic>))
          .toList()
      ..permissions = (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..role = json['role'] as String?
      ..roleDisplay = json['role_display'] as String?
      ..isVerified = json['is_verified'] as bool?
      ..timezone = json['timezone'] as String?
      ..language = json['language'] as String?
      ..loggedTime = json['logged_time'] as String?;

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'email': instance.email,
      'id': instance.id,
      'effective_language': instance.effectiveLanguage,
      'email_subscribed': instance.emailSubscribed,
      'profile': instance.profile,
      'is_active': instance.isActive,
      'when_joined': instance.whenJoined,
      'last_login': instance.lastLogin,
      'groups': instance.groups,
      'permissions': instance.permissions,
      'role': instance.role,
      'role_display': instance.roleDisplay,
      'is_verified': instance.isVerified,
      'timezone': instance.timezone,
      'language': instance.language,
      'logged_time': instance.loggedTime,
    };

Lines _$LinesFromJson(Map<String, dynamic> json) => Lines(
      id: json['id'] as int,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    )..photo = json['photo'] == null
        ? null
        : RaceFile.fromJson(json['photo'] as Map<String, dynamic>);

Map<String, dynamic> _$LinesToJson(Lines instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'id': instance.id,
      'last_name': instance.lastName,
      'photo': instance.photo,
    };
