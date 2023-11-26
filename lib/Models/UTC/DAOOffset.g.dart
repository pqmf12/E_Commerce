// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOOffset.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOOffset _$DAOOffsetFromJson(Map<String, dynamic> json) => DAOOffset(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: json['data'] == null
          ? null
          : Utc.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DAOOffsetToJson(DAOOffset instance) => <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

Utc _$UtcFromJson(Map<String, dynamic> json) => Utc(
      offset: json['offset'],
    );

Map<String, dynamic> _$UtcToJson(Utc instance) => <String, dynamic>{
      'offset': instance.offset,
    };
