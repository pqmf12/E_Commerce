// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOfeatured.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOfeatured _$DAOfeaturedFromJson(Map<String, dynamic> json) => DAOfeatured(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Featured.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DAOfeaturedToJson(DAOfeatured instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

Featured _$FeaturedFromJson(Map<String, dynamic> json) => Featured(
      module_id: json['module_id'],
      name: json['name'],
      code: json['code'],
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => featuredproduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FeaturedToJson(Featured instance) => <String, dynamic>{
      'module_id': instance.module_id,
      'name': instance.name,
      'code': instance.code,
      'products': instance.products,
    };

featuredproduct _$featuredproductFromJson(Map<String, dynamic> json) =>
    featuredproduct(
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
      rating: json['rating'],
      special_start_date: json['special_start_date'],
      special_end_date: json['special_end_date'],
      description: json['description'],
    );

Map<String, dynamic> _$featuredproductToJson(featuredproduct instance) =>
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
      'rating': instance.rating,
      'special_start_date': instance.special_start_date,
      'special_end_date': instance.special_end_date,
      'description': instance.description,
    };
