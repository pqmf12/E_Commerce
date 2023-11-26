// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOInfoDetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOInfoDetails _$DAOInfoDetailsFromJson(Map<String, dynamic> json) =>
    DAOInfoDetails(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: json['data'] == null
          ? null
          : Details.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DAOInfoDetailsToJson(DAOInfoDetails instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      information_id: json['information_id'],
      bottom: json['bottom'],
      sort_order: json['sort_order'],
      status: json['status'],
      language_id: json['language_id'],
      title: json['title'],
      description: json['description'],
      meta_title: json['meta_title'],
      meta_description: json['meta_description'],
      meta_keyword: json['meta_keyword'],
      store_id: json['store_id'],
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'information_id': instance.information_id,
      'bottom': instance.bottom,
      'sort_order': instance.sort_order,
      'status': instance.status,
      'language_id': instance.language_id,
      'title': instance.title,
      'description': instance.description,
      'meta_title': instance.meta_title,
      'meta_description': instance.meta_description,
      'meta_keyword': instance.meta_keyword,
      'store_id': instance.store_id,
    };
