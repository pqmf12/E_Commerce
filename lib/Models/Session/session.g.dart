// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

session _$sessionFromJson(Map<String, dynamic> json) => session(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$sessionToJson(session instance) => <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      session: json['session'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'session': instance.session,
    };
