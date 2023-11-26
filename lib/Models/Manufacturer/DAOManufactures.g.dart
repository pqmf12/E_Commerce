// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOManufactures.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOManufactures _$DAOManufacturesFromJson(Map<String, dynamic> json) =>
    DAOManufactures(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ManufacturerList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DAOManufacturesToJson(DAOManufactures instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

ManufacturerList _$ManufacturerListFromJson(Map<String, dynamic> json) =>
    ManufacturerList(
      manufacturer_id: json['manufacturer_id'],
      name: json['name'],
      image: json['image'],
      original_image: json['original_image'],
      sort_order: json['sort_order'],
    );

Map<String, dynamic> _$ManufacturerListToJson(ManufacturerList instance) =>
    <String, dynamic>{
      'manufacturer_id': instance.manufacturer_id,
      'name': instance.name,
      'image': instance.image,
      'original_image': instance.original_image,
      'sort_order': instance.sort_order,
    };
