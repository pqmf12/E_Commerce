// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOGetWishlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOGetWishlist _$DAOGetWishlistFromJson(Map<String, dynamic> json) =>
    DAOGetWishlist(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WishlistProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DAOGetWishlistToJson(DAOGetWishlist instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

WishlistProduct _$WishlistProductFromJson(Map<String, dynamic> json) =>
    WishlistProduct(
      product_id: json['product_id'],
      thumb: json['thumb'],
      name: json['name'],
      model: json['model'],
      stock: json['stock'],
      price: json['price'],
      special: json['special'],
    );

Map<String, dynamic> _$WishlistProductToJson(WishlistProduct instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'thumb': instance.thumb,
      'name': instance.name,
      'model': instance.model,
      'stock': instance.stock,
      'price': instance.price,
      'special': instance.special,
    };
