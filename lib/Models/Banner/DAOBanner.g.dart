// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOBanner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOBanner _$DAOBannerFromJson(Map<String, dynamic> json) => DAOBanner(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BannerList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DAOBannerToJson(DAOBanner instance) => <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

BannerList _$BannerListFromJson(Map<String, dynamic> json) => BannerList(
      banner_id: json['banner_id'],
      name: json['name'],
      status: json['status'],
      checksum: json['checksum'],
    );

Map<String, dynamic> _$BannerListToJson(BannerList instance) =>
    <String, dynamic>{
      'banner_id': instance.banner_id,
      'name': instance.name,
      'status': instance.status,
      'checksum': instance.checksum,
    };
