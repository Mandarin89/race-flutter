import 'package:json_annotation/json_annotation.dart';

part 'race_file.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RaceFile {
  int id;
  String name;
  String originalFilename;
  String file;
  String mimeType;
  int size;
  String? created;
  bool? isValid;
  String? modified;
  String? preview;
  String? title;
  Thumbnails? thumbnails;

  RaceFile(
      {required this.id,
      required this.name,
      required this.originalFilename,
      required this.file,
      required this.mimeType,
      required this.size});

  factory RaceFile.fromJson(Map<String, dynamic> json) =>
      _$RaceFileFromJson(json);

  Map<String, dynamic> toJson() => _$RaceFileToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Thumbnails {
  String? large;
  String? medium;
  String? small;

  Thumbnails();

  factory Thumbnails.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailsFromJson(json);

  Map<String, dynamic> toJson() => _$ThumbnailsToJson(this);
}
