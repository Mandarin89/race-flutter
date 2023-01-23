// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_user_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaceUserGroup _$RaceUserGroupFromJson(Map<String, dynamic> json) =>
    RaceUserGroup(
      id: json['id'] as int,
      name: json['name'] as String,
      color: json['color'] as String?,
      isLead: json['is_lead'] as bool?,
      isPrimary: json['is_primary'] as bool?,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      systemName: json['system_name'] as String?,
    );

Map<String, dynamic> _$RaceUserGroupToJson(RaceUserGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'color': instance.color,
      'is_lead': instance.isLead,
      'is_primary': instance.isPrimary,
      'permissions': instance.permissions,
      'system_name': instance.systemName,
    };
