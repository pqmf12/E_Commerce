// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOSubCategory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOSubCategory _$DAOSubCategoryFromJson(Map<String, dynamic> json) =>
    DAOSubCategory(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DAOSubCategoryToJson(DAOSubCategory instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      original_image: json['original_image'],
      filters: json['filters'],
      sub_categories: (json['sub_categories'] as List<dynamic>?)
          ?.map((e) => subcategories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'original_image': instance.original_image,
      'filters': instance.filters,
      'sub_categories': instance.sub_categories,
    };

subcategories _$subcategoriesFromJson(Map<String, dynamic> json) =>
    subcategories(
      category_id: json['category_id'],
      parent_id: json['parent_id'],
      name: json['name'],
      image: json['image'],
      original_image: json['original_image'],
      filters: json['filters'],
      categories: json['categories'],
    );

Map<String, dynamic> _$subcategoriesToJson(subcategories instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'parent_id': instance.parent_id,
      'name': instance.name,
      'image': instance.image,
      'original_image': instance.original_image,
      'filters': instance.filters,
      'categories': instance.categories,
    };
