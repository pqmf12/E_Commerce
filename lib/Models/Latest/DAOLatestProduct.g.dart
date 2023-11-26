// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOLatestProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOLatestProduct _$DAOLatestProductFromJson(Map<String, dynamic> json) =>
    DAOLatestProduct(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LatestProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DAOLatestProductToJson(DAOLatestProduct instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

LatestProduct _$LatestProductFromJson(Map<String, dynamic> json) =>
    LatestProduct(
      product_id: json['product_id'],
      thumb: json['thumb'],
      name: json['name'],
      quantity: json['quantity'],
      status: json['status'],
      stock_status: json['stock_status'],
      price_excluding_tax: json['price_excluding_tax'],
      price_excluding_tax_formated: json['price_excluding_tax_formated'],
      price: json['price'],
      price_formated: json['price_formated'],
      special: json['special'],
      special_formated: json['special_formated'],
      special_excluding_tax: json['special_excluding_tax'],
      special_excluding_tax_formated: json['special_excluding_tax_formated'],
      discounts: json['discounts'],
      rating: json['rating'],
      description: json['description'],
    );

Map<String, dynamic> _$LatestProductToJson(LatestProduct instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'thumb': instance.thumb,
      'name': instance.name,
      'quantity': instance.quantity,
      'status': instance.status,
      'stock_status': instance.stock_status,
      'price_excluding_tax': instance.price_excluding_tax,
      'price_excluding_tax_formated': instance.price_excluding_tax_formated,
      'price': instance.price,
      'price_formated': instance.price_formated,
      'special': instance.special,
      'special_formated': instance.special_formated,
      'special_excluding_tax': instance.special_excluding_tax,
      'special_excluding_tax_formated': instance.special_excluding_tax_formated,
      'discounts': instance.discounts,
      'rating': instance.rating,
      'description': instance.description,
    };
