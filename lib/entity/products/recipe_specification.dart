import 'package:json_annotation/json_annotation.dart';
import 'package:race/entity/profile/profile.dart';

part 'recipe_specification.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RecipeSpecification {
  RecipeSpecification({
    required this.id,
    this.variant,
    this.costingUnitPackaging,
    this.costingBatchLabor,
    this.supplier,
    this.costingBatchOverhead,
    this.welcomeFactory,
    this.relevantStatusLog,
    this.packageNetWeightNumber,
    this.packageNetWeightUnit,
    this.servingsPerPackage,
    this.suggestedServingSize,
    this.caloriesTotal,
    this.caloriesFromFat,
    this.syncNutrients,
    this.syncCostings,
    this.totalCostPerBatch,
    this.totalCostPerUnit,
    this.ingredientsSaved,
    this.ingredientsSavedBy,
    this.nutrientsSaved,
    this.nutrientsSavedBy,
    this.propertiesSaved,
    this.propertiesSavedBy,
    this.allergensSaved,
    this.allergensSavedBy,
    this.designsSaved,
    this.designsSavedBy,
    this.costingsSaved,
    this.costingsSavedBy,
    this.status,
    this.statusDisplay,
    this.relevantSubmittedStatusLog,
    this.relevantRequestedStatusLog,
    this.costing,
    this.designs,
    this.materials,
    this.properties,
    this.createdBy,
    this.modifiedBy,
    this.created,
    this.modified,
  });

  int id;
  Variant? variant;
  int? costingUnitPackaging;
  int? costingBatchLabor;
  Supplier? supplier;
  int? costingBatchOverhead;
  dynamic welcomeFactory;
  RelevantStatusLog? relevantStatusLog;
  dynamic packageNetWeightNumber;
  dynamic packageNetWeightUnit;
  dynamic servingsPerPackage;
  dynamic suggestedServingSize;
  int? caloriesTotal;
  int? caloriesFromFat;
  bool? syncNutrients;
  bool? syncCostings;
  int? totalCostPerBatch;
  int? totalCostPerUnit;
  dynamic ingredientsSaved;
  dynamic ingredientsSavedBy;
  dynamic nutrientsSaved;
  dynamic nutrientsSavedBy;
  dynamic propertiesSaved;
  dynamic propertiesSavedBy;
  dynamic allergensSaved;
  dynamic allergensSavedBy;
  dynamic designsSaved;
  dynamic designsSavedBy;
  dynamic costingsSaved;
  dynamic costingsSavedBy;
  String? status;
  String? statusDisplay;
  dynamic relevantSubmittedStatusLog;
  RelevantStatusLog? relevantRequestedStatusLog;
  bool? costing;
  bool? designs;
  bool? materials;
  bool? properties;
  Profile? createdBy;
  Profile? modifiedBy;
  DateTime? created;
  DateTime? modified;

  factory RecipeSpecification.fromJson(Map<String, dynamic> json) =>
      _$RecipeSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeSpecificationToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class RelevantStatusLog {
  RelevantStatusLog({
    required this.id,
    this.createdBy,
    this.status,
    this.statusDisplay,
    this.created,
  });

  int id;
  Profile? createdBy;
  String? status;
  String? statusDisplay;
  DateTime? created;

  factory RelevantStatusLog.fromJson(Map<String, dynamic> json) =>
      _$RelevantStatusLogFromJson(json);

  Map<String, dynamic> toJson() => _$RelevantStatusLogToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Supplier {
  Supplier({
    required this.id,
    this.name,
  });

  int id;
  String? name;

  factory Supplier.fromJson(Map<String, dynamic> json) =>
      _$SupplierFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Variant {
  Variant({
    required this.id,
    this.name,
    this.product,
    this.internalId,
    this.numberOfUnits,
    this.estAnnualQty,
  });

  int id;
  String? name;
  Product? product;
  String? internalId;
  int? numberOfUnits;
  int? estAnnualQty;

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Product {
  Product({
    required this.id,
    this.name,
    this.code,
  });

  int id;
  String? name;
  String? code;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
