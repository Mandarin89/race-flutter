import 'package:json_annotation/json_annotation.dart';
import 'package:race/entity/common/race_user_group.dart';
import 'package:race/entity/profile/profile.dart';

part 'task.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Task {
  int id;
  List<dynamic>? documents;
  List<RaceUserGroup>? informedGroups;
  List<dynamic>? preDependencies;
  bool? isPmTask;
  String? color;
  bool? isKey;
  bool? isAutocomplete;
  String? name;
  int? duration;
  int? order;
  dynamic assignedGroup;
  AssignedTo? assignedTo;
  Phase? phase;
  bool? unviewedMessagesExist;
  int? unviewedMessagesCount;
  int? unviewedMentionsCount;
  String? description;
  String? status;
  String? statusDisplay;
  int? slotsCount;
  dynamic completedBy;
  dynamic signedOffBy;
  int? submissionsCount;
  int? versionsCount;
  bool? approvalRequired;
  bool? isDelayed;
  bool? assignmentRequired;
  dynamic completed;
  dynamic signedOff;
  dynamic actualStartDate;
  DateTime? endDate;
  dynamic loggedTime;
  DateTime? startDate;
  List<dynamic>? approvalGroupsDefaultUsers;
  List<dynamic>? informedGroupsDefaultUsers;
  CurrentUserRoles? currentYserRoles;

  Task({required this.id});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class AssignedTo {
  AssignedTo({
    this.id,
    this.email,
    this.profile,
    this.whenJoined,
  });

  int? id;
  String? email;
  Profile? profile;
  DateTime? whenJoined;

  factory AssignedTo.fromJson(Map<String, dynamic> json) =>
      _$AssignedToFromJson(json);

  Map<String, dynamic> toJson() => _$AssignedToToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Phase {
  Phase({
    this.id,
    this.name,
    this.project,
  });

  int? id;
  String? name;
  Project? project;

  factory Phase.fromJson(Map<String, dynamic> json) => _$PhaseFromJson(json);

  Map<String, dynamic> toJson() => _$PhaseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Project {
  Project({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrentUserRoles {
  CurrentUserRoles({
    this.isProjectManager,
    this.isAssignedToTask,
    this.isContainerApproval,
    this.isContainerLoopApproval,
    this.isDesignApproval,
    this.isDesignLoopApproval,
    this.isTaskInformed,
  });

  bool? isProjectManager;
  bool? isAssignedToTask;
  bool? isContainerApproval;
  bool? isContainerLoopApproval;
  bool? isDesignApproval;
  bool? isDesignLoopApproval;
  bool? isTaskInformed;

  factory CurrentUserRoles.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserRolesFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUserRolesToJson(this);
}
