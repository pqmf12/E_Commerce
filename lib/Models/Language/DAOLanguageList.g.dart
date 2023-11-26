// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOLanguageList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOLanguageList _$DAOLanguageListFromJson(Map<String, dynamic> json) =>
    DAOLanguageList(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LangList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DAOLanguageListToJson(DAOLanguageList instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

LangList _$LangListFromJson(Map<String, dynamic> json) => LangList(
      language_id: json['language_id'],
      name: json['name'],
      code: json['code'],
      locale: json['locale'],
      image: json['image'],
      directory: json['directory'],
      filename: json['filename'],
      sort_order: json['sort_order'],
      status: json['status'],
    );

Map<String, dynamic> _$LangListToJson(LangList instance) => <String, dynamic>{
      'language_id': instance.language_id,
      'name': instance.name,
      'code': instance.code,
      'locale': instance.locale,
      'image': instance.image,
      'directory': instance.directory,
      'filename': instance.filename,
      'sort_order': instance.sort_order,
      'status': instance.status,
    };
