// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOInformation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOInformation _$DAOInformationFromJson(Map<String, dynamic> json) =>
    DAOInformation(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => InformationList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DAOInformationToJson(DAOInformation instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

InformationList _$InformationListFromJson(Map<String, dynamic> json) =>
    InformationList(
      id: json['id'],
      title: json['title'],
    );

Map<String, dynamic> _$InformationListToJson(InformationList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
