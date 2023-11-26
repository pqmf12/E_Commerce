// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOCompare.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOCompare _$DAOCompareFromJson(Map<String, dynamic> json) => DAOCompare(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Compareproducts.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DAOCompareToJson(DAOCompare instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

Compareproducts _$CompareproductsFromJson(Map<String, dynamic> json) =>
    Compareproducts(
      product_id: json['product_id'],
      name: json['name'],
      thumb: json['thumb'],
      price: json['price'],
      special: json['special'],
      description: json['description'],
      model: json['model'],
      manufacturer: json['manufacturer'],
      availability: json['availability'],
      minimum: json['minimum'],
      rating: json['rating'],
      reviews: json['reviews'],
      weight: json['weight'],
      length: json['length'],
      width: json['width'],
      height: json['height'],
      attribute: json['attribute'],
    );

Map<String, dynamic> _$CompareproductsToJson(Compareproducts instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'name': instance.name,
      'thumb': instance.thumb,
      'price': instance.price,
      'special': instance.special,
      'description': instance.description,
      'model': instance.model,
      'manufacturer': instance.manufacturer,
      'availability': instance.availability,
      'minimum': instance.minimum,
      'rating': instance.rating,
      'reviews': instance.reviews,
      'weight': instance.weight,
      'length': instance.length,
      'width': instance.width,
      'height': instance.height,
      'attribute': instance.attribute,
    };
