// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOBannerDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOBannerDetail _$DAOBannerDetailFromJson(Map<String, dynamic> json) =>
    DAOBannerDetail(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BannerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DAOBannerDetailToJson(DAOBannerDetail instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

BannerData _$BannerDataFromJson(Map<String, dynamic> json) => BannerData(
      title: json['title'],
      link: json['link'],
      image: json['image'],
    );

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'link': instance.link,
      'image': instance.image,
    };
