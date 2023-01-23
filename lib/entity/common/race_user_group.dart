import 'package:json_annotation/json_annotation.dart';

part 'race_user_group.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RaceUserGroup {
  int id;
  String name;
  String? color;
  bool? isLead;
  bool? isPrimary;
  List<String>? permissions;
  String? systemName;

  RaceUserGroup(
      {required this.id,
      required this.name,
      this.color,
      this.isLead,
      this.isPrimary,
      this.permissions,
      this.systemName});

  factory RaceUserGroup.fromJson(Map<String, dynamic> json) =>
      _$RaceUserGroupFromJson(json);

  Map<String, dynamic> toJson() => _$RaceUserGroupToJson(this);
}
