// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCategory _$ListCategoryFromJson(Map<String, dynamic> json) => ListCategory(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCategoryToJson(ListCategory instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      category_id: json['category_id'],
      parent_id: json['parent_id'],
      name: json['name'],
      image: json['image'],
      original_image: json['original_image'],
      filters: json['filters'],
      filter_groups: json['filter_groups'],
      categories: json['categories'],
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'parent_id': instance.parent_id,
      'name': instance.name,
      'image': instance.image,
      'original_image': instance.original_image,
      'filters': instance.filters,
      'filter_groups': instance.filter_groups,
      'categories': instance.categories,
    };
