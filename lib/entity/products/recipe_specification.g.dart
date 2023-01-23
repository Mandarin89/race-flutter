// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_specification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeSpecification _$RecipeSpecificationFromJson(Map<String, dynamic> json) =>
    RecipeSpecification(
      id: json['id'] as int,
      variant: json['variant'] == null
          ? null
          : Variant.fromJson(json['variant'] as Map<String, dynamic>),
      costingUnitPackaging: json['costing_unit_packaging'] as int?,
      costingBatchLabor: json['costing_batch_labor'] as int?,
      supplier: json['supplier'] == null
          ? null
          : Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
      costingBatchOverhead: json['costing_batch_overhead'] as int?,
      welcomeFactory: json['welcome_factory'],
      relevantStatusLog: json['relevant_status_log'] == null
          ? null
          : RelevantStatusLog.fromJson(
              json['relevant_status_log'] as Map<String, dynamic>),
      packageNetWeightNumber: json['package_net_weight_number'],
      packageNetWeightUnit: json['package_net_weight_unit'],
      servingsPerPackage: json['servings_per_package'],
      suggestedServingSize: json['suggested_serving_size'],
      caloriesTotal: json['calories_total'] as int?,
      caloriesFromFat: json['calories_from_fat'] as int?,
      syncNutrients: json['sync_nutrients'] as bool?,
      syncCostings: json['sync_costings'] as bool?,
      totalCostPerBatch: json['total_cost_per_batch'] as int?,
      totalCostPerUnit: json['total_cost_per_unit'] as int?,
      ingredientsSaved: json['ingredients_saved'],
      ingredientsSavedBy: json['ingredients_saved_by'],
      nutrientsSaved: json['nutrients_saved'],
      nutrientsSavedBy: json['nutrients_saved_by'],
      propertiesSaved: json['properties_saved'],
      propertiesSavedBy: json['properties_saved_by'],
      allergensSaved: json['allergens_saved'],
      allergensSavedBy: json['allergens_saved_by'],
      designsSaved: json['designs_saved'],
      designsSavedBy: json['designs_saved_by'],
      costingsSaved: json['costings_saved'],
      costingsSavedBy: json['costings_saved_by'],
      status: json['status'] as String?,
      statusDisplay: json['status_display'] as String?,
      relevantSubmittedStatusLog: json['relevant_submitted_status_log'],
      relevantRequestedStatusLog: json['relevant_requested_status_log'] == null
          ? null
          : RelevantStatusLog.fromJson(
              json['relevant_requested_status_log'] as Map<String, dynamic>),
      costing: json['costing'] as bool?,
      designs: json['designs'] as bool?,
      materials: json['materials'] as bool?,
      properties: json['properties'] as bool?,
      createdBy: json['created_by'] == null
          ? null
          : Profile.fromJson(json['created_by'] as Map<String, dynamic>),
      modifiedBy: json['modified_by'] == null
          ? null
          : Profile.fromJson(json['modified_by'] as Map<String, dynamic>),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      modified: json['modified'] == null
          ? null
          : DateTime.parse(json['modified'] as String),
    );

Map<String, dynamic> _$RecipeSpecificationToJson(
        RecipeSpecification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'variant': instance.variant,
      'costing_unit_packaging': instance.costingUnitPackaging,
      'costing_batch_labor': instance.costingBatchLabor,
      'supplier': instance.supplier,
      'costing_batch_overhead': instance.costingBatchOverhead,
      'welcome_factory': instance.welcomeFactory,
      'relevant_status_log': instance.relevantStatusLog,
      'package_net_weight_number': instance.packageNetWeightNumber,
      'package_net_weight_unit': instance.packageNetWeightUnit,
      'servings_per_package': instance.servingsPerPackage,
      'suggested_serving_size': instance.suggestedServingSize,
      'calories_total': instance.caloriesTotal,
      'calories_from_fat': instance.caloriesFromFat,
      'sync_nutrients': instance.syncNutrients,
      'sync_costings': instance.syncCostings,
      'total_cost_per_batch': instance.totalCostPerBatch,
      'total_cost_per_unit': instance.totalCostPerUnit,
      'ingredients_saved': instance.ingredientsSaved,
      'ingredients_saved_by': instance.ingredientsSavedBy,
      'nutrients_saved': instance.nutrientsSaved,
      'nutrients_saved_by': instance.nutrientsSavedBy,
      'properties_saved': instance.propertiesSaved,
      'properties_saved_by': instance.propertiesSavedBy,
      'allergens_saved': instance.allergensSaved,
      'allergens_saved_by': instance.allergensSavedBy,
      'designs_saved': instance.designsSaved,
      'designs_saved_by': instance.designsSavedBy,
      'costings_saved': instance.costingsSaved,
      'costings_saved_by': instance.costingsSavedBy,
      'status': instance.status,
      'status_display': instance.statusDisplay,
      'relevant_submitted_status_log': instance.relevantSubmittedStatusLog,
      'relevant_requested_status_log': instance.relevantRequestedStatusLog,
      'costing': instance.costing,
      'designs': instance.designs,
      'materials': instance.materials,
      'properties': instance.properties,
      'created_by': instance.createdBy,
      'modified_by': instance.modifiedBy,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
    };

RelevantStatusLog _$RelevantStatusLogFromJson(Map<String, dynamic> json) =>
    RelevantStatusLog(
      id: json['id'] as int,
      createdBy: json['created_by'] == null
          ? null
          : Profile.fromJson(json['created_by'] as Map<String, dynamic>),
      status: json['status'] as String?,
      statusDisplay: json['status_display'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$RelevantStatusLogToJson(RelevantStatusLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'status': instance.status,
      'status_display': instance.statusDisplay,
      'created': instance.created?.toIso8601String(),
    };

Supplier _$SupplierFromJson(Map<String, dynamic> json) => Supplier(
      id: json['id'] as int,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SupplierToJson(Supplier instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Variant _$VariantFromJson(Map<String, dynamic> json) => Variant(
      id: json['id'] as int,
      name: json['name'] as String?,
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      internalId: json['internal_id'] as String?,
      numberOfUnits: json['number_of_units'] as int?,
      estAnnualQty: json['est_annual_qty'] as int?,
    );

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'product': instance.product,
      'internal_id': instance.internalId,
      'number_of_units': instance.numberOfUnits,
      'est_annual_qty': instance.estAnnualQty,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int,
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
