// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: json['id'] as int,
    )
      ..documents = json['documents'] as List<dynamic>?
      ..informedGroups = (json['informed_groups'] as List<dynamic>?)
          ?.map((e) => RaceUserGroup.fromJson(e as Map<String, dynamic>))
          .toList()
      ..preDependencies = json['pre_dependencies'] as List<dynamic>?
      ..isPmTask = json['is_pm_task'] as bool?
      ..color = json['color'] as String?
      ..isKey = json['is_key'] as bool?
      ..isAutocomplete = json['is_autocomplete'] as bool?
      ..name = json['name'] as String?
      ..duration = json['duration'] as int?
      ..order = json['order'] as int?
      ..assignedGroup = json['assigned_group']
      ..assignedTo = json['assigned_to'] == null
          ? null
          : AssignedTo.fromJson(json['assigned_to'] as Map<String, dynamic>)
      ..phase = json['phase'] == null
          ? null
          : Phase.fromJson(json['phase'] as Map<String, dynamic>)
      ..unviewedMessagesExist = json['unviewed_messages_exist'] as bool?
      ..unviewedMessagesCount = json['unviewed_messages_count'] as int?
      ..unviewedMentionsCount = json['unviewed_mentions_count'] as int?
      ..description = json['description'] as String?
      ..status = json['status'] as String?
      ..statusDisplay = json['status_display'] as String?
      ..slotsCount = json['slots_count'] as int?
      ..completedBy = json['completed_by']
      ..signedOffBy = json['signed_off_by']
      ..submissionsCount = json['submissions_count'] as int?
      ..versionsCount = json['versions_count'] as int?
      ..approvalRequired = json['approval_required'] as bool?
      ..isDelayed = json['is_delayed'] as bool?
      ..assignmentRequired = json['assignment_required'] as bool?
      ..completed = json['completed']
      ..signedOff = json['signed_off']
      ..actualStartDate = json['actual_start_date']
      ..endDate = json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String)
      ..loggedTime = json['logged_time']
      ..startDate = json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String)
      ..approvalGroupsDefaultUsers =
          json['approval_groups_default_users'] as List<dynamic>?
      ..informedGroupsDefaultUsers =
          json['informed_groups_default_users'] as List<dynamic>?
      ..currentYserRoles = json['current_yser_roles'] == null
          ? null
          : CurrentUserRoles.fromJson(
              json['current_yser_roles'] as Map<String, dynamic>);

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'documents': instance.documents,
      'informed_groups': instance.informedGroups,
      'pre_dependencies': instance.preDependencies,
      'is_pm_task': instance.isPmTask,
      'color': instance.color,
      'is_key': instance.isKey,
      'is_autocomplete': instance.isAutocomplete,
      'name': instance.name,
      'duration': instance.duration,
      'order': instance.order,
      'assigned_group': instance.assignedGroup,
      'assigned_to': instance.assignedTo,
      'phase': instance.phase,
      'unviewed_messages_exist': instance.unviewedMessagesExist,
      'unviewed_messages_count': instance.unviewedMessagesCount,
      'unviewed_mentions_count': instance.unviewedMentionsCount,
      'description': instance.description,
      'status': instance.status,
      'status_display': instance.statusDisplay,
      'slots_count': instance.slotsCount,
      'completed_by': instance.completedBy,
      'signed_off_by': instance.signedOffBy,
      'submissions_count': instance.submissionsCount,
      'versions_count': instance.versionsCount,
      'approval_required': instance.approvalRequired,
      'is_delayed': instance.isDelayed,
      'assignment_required': instance.assignmentRequired,
      'completed': instance.completed,
      'signed_off': instance.signedOff,
      'actual_start_date': instance.actualStartDate,
      'end_date': instance.endDate?.toIso8601String(),
      'logged_time': instance.loggedTime,
      'start_date': instance.startDate?.toIso8601String(),
      'approval_groups_default_users': instance.approvalGroupsDefaultUsers,
      'informed_groups_default_users': instance.informedGroupsDefaultUsers,
      'current_yser_roles': instance.currentYserRoles,
    };

AssignedTo _$AssignedToFromJson(Map<String, dynamic> json) => AssignedTo(
      id: json['id'] as int?,
      email: json['email'] as String?,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      whenJoined: json['when_joined'] == null
          ? null
          : DateTime.parse(json['when_joined'] as String),
    );

Map<String, dynamic> _$AssignedToToJson(AssignedTo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'profile': instance.profile,
      'when_joined': instance.whenJoined?.toIso8601String(),
    };

Phase _$PhaseFromJson(Map<String, dynamic> json) => Phase(
      id: json['id'] as int?,
      name: json['name'] as String?,
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PhaseToJson(Phase instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'project': instance.project,
    };

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

CurrentUserRoles _$CurrentUserRolesFromJson(Map<String, dynamic> json) =>
    CurrentUserRoles(
      isProjectManager: json['is_project_manager'] as bool?,
      isAssignedToTask: json['is_assigned_to_task'] as bool?,
      isContainerApproval: json['is_container_approval'] as bool?,
      isContainerLoopApproval: json['is_container_loop_approval'] as bool?,
      isDesignApproval: json['is_design_approval'] as bool?,
      isDesignLoopApproval: json['is_design_loop_approval'] as bool?,
      isTaskInformed: json['is_task_informed'] as bool?,
    );

Map<String, dynamic> _$CurrentUserRolesToJson(CurrentUserRoles instance) =>
    <String, dynamic>{
      'is_project_manager': instance.isProjectManager,
      'is_assigned_to_task': instance.isAssignedToTask,
      'is_container_approval': instance.isContainerApproval,
      'is_container_loop_approval': instance.isContainerLoopApproval,
      'is_design_approval': instance.isDesignApproval,
      'is_design_loop_approval': instance.isDesignLoopApproval,
      'is_task_informed': instance.isTaskInformed,
    };
