// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'race_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RaceFile _$RaceFileFromJson(Map<String, dynamic> json) => RaceFile(
      id: json['id'] as int,
      name: json['name'] as String,
      originalFilename: json['original_filename'] as String,
      file: json['file'] as String,
      mimeType: json['mime_type'] as String,
      size: json['size'] as int,
    )
      ..created = json['created'] as String?
      ..isValid = json['is_valid'] as bool?
      ..modified = json['modified'] as String?
      ..preview = json['preview'] as String?
      ..title = json['title'] as String?
      ..thumbnails = json['thumbnails'] == null
          ? null
          : Thumbnails.fromJson(json['thumbnails'] as Map<String, dynamic>);

Map<String, dynamic> _$RaceFileToJson(RaceFile instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'original_filename': instance.originalFilename,
      'file': instance.file,
      'mime_type': instance.mimeType,
      'size': instance.size,
      'created': instance.created,
      'is_valid': instance.isValid,
      'modified': instance.modified,
      'preview': instance.preview,
      'title': instance.title,
      'thumbnails': instance.thumbnails,
    };

Thumbnails _$ThumbnailsFromJson(Map<String, dynamic> json) => Thumbnails()
  ..large = json['large'] as String?
  ..medium = json['medium'] as String?
  ..small = json['small'] as String?;

Map<String, dynamic> _$ThumbnailsToJson(Thumbnails instance) =>
    <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
    };
