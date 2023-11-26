// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOLanguageDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageDetail _$LanguageDetailFromJson(Map<String, dynamic> json) =>
    LanguageDetail(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: json['data'] == null
          ? null
          : LangDetail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LanguageDetailToJson(LanguageDetail instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

LangDetail _$LangDetailFromJson(Map<String, dynamic> json) => LangDetail(
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

Map<String, dynamic> _$LangDetailToJson(LangDetail instance) =>
    <String, dynamic>{
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
