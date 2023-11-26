// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

categories _$categoriesFromJson(Map<String, dynamic> json) => categories(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$categoriesToJson(categories instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

category _$categoryFromJson(Map<String, dynamic> json) => category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      original_image: json['original_image'],
      status: json['status'],
      parent_id: json['parent_id'],
      filters: json['filters'],
    );

Map<String, dynamic> _$categoryToJson(category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'original_image': instance.original_image,
      'status': instance.status,
      'parent_id': instance.parent_id,
      'filters': instance.filters,
    };
