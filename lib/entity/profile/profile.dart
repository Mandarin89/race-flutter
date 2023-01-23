import 'package:json_annotation/json_annotation.dart';
import 'package:race/entity/common/race_file.dart';
import 'package:race/entity/common/race_user_group.dart';

part 'profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Profile {
  String? email;
  int id;
  String? effectiveLanguage;
  bool? emailSubscribed;
  Lines? profile;
  bool? isActive;
  String? whenJoined;
  String? lastLogin;
  List<RaceUserGroup>? groups;
  List<String>? permissions;
  String? role;
  String? roleDisplay;
  bool? isVerified;
  String? timezone;
  String? language;
  String? loggedTime;

  Profile({required this.id});

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Lines {
  String? firstName;
  int id;
  String? lastName;
  RaceFile? photo;

  Lines({required this.id, this.firstName, this.lastName});

  factory Lines.fromJson(Map<String, dynamic> json) => _$LinesFromJson(json);

  Map<String, dynamic> toJson() => _$LinesToJson(this);
}