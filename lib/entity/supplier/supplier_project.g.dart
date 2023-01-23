// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier_project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupplierProject _$SupplierProjectFromJson(Map<String, dynamic> json) =>
    SupplierProject(
      criterionLinks: json['criterion_links'] as List<dynamic>?,
      criterionLinksLastModified: json['criterion_links_last_modified'],
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      supplier: json['supplier'] == null
          ? null
          : Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
      sumRatingsScore: json['sum_ratings_score'],
      productScore: json['product_score'],
      isRated: json['is_rated'] as bool?,
      productsCount: json['products_count'] as int?,
      projectActualEndDate: json['project_actual_end_date'] == null
          ? null
          : DateTime.parse(json['project_actual_end_date'] as String),
    );

Map<String, dynamic> _$SupplierProjectToJson(SupplierProject instance) =>
    <String, dynamic>{
      'criterion_links': instance.criterionLinks,
      'criterion_links_last_modified': instance.criterionLinksLastModified,
      'project': instance.project,
      'supplier': instance.supplier,
      'sum_ratings_score': instance.sumRatingsScore,
      'product_score': instance.productScore,
      'is_rated': instance.isRated,
      'products_count': instance.productsCount,
      'project_actual_end_date':
          instance.projectActualEndDate?.toIso8601String(),
    };

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as int?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      manager: json['manager'] == null
          ? null
          : Profile.fromJson(json['manager'] as Map<String, dynamic>),
      name: json['name'] as String?,
      status: json['status'] as String?,
      statusDisplay: json['status_display'] as String?,
      customId: json['custom_id'] as int?,
      launchDate: json['launch_date'] == null
          ? null
          : DateTime.parse(json['launch_date'] as String),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'manager': instance.manager,
      'name': instance.name,
      'status': instance.status,
      'status_display': instance.statusDisplay,
      'custom_id': instance.customId,
      'launch_date': instance.launchDate?.toIso8601String(),
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int?,
      name: json['name'] as String?,
      customId: json['custom_id'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'custom_id': instance.customId,
    };

Supplier _$SupplierFromJson(Map<String, dynamic> json) => Supplier(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SupplierToJson(Supplier instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
