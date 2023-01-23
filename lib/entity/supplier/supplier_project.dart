import 'package:json_annotation/json_annotation.dart';
import 'package:race/entity/profile/profile.dart';

part 'supplier_project.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SupplierProject {
  SupplierProject({
    this.criterionLinks,
    this.criterionLinksLastModified,
    this.project,
    this.supplier,
    this.sumRatingsScore,
    this.productScore,
    this.isRated,
    this.productsCount,
    this.projectActualEndDate,
  });

  List<dynamic>? criterionLinks;
  dynamic criterionLinksLastModified;
  Project? project;
  Supplier? supplier;
  dynamic sumRatingsScore;
  dynamic productScore;
  bool? isRated;
  int? productsCount;
  DateTime? projectActualEndDate;

  factory SupplierProject.fromJson(Map<String, dynamic> json) =>
      _$SupplierProjectFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierProjectToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Project {
  Project({
    this.id,
    this.category,
    this.manager,
    this.name,
    this.status,
    this.statusDisplay,
    this.customId,
    this.launchDate,
  });

  int? id;
  Category? category;
  Profile? manager;
  String? name;
  String? status;
  String? statusDisplay;
  int? customId;
  DateTime? launchDate;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Category {
  Category({
    this.id,
    this.name,
    this.customId,
  });

  int? id;
  String? name;
  String? customId;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Supplier {
  Supplier({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Supplier.fromJson(Map<String, dynamic> json) =>
      _$SupplierFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierToJson(this);
}
