// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AddCart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCart _$AddCartFromJson(Map<String, dynamic> json) => AddCart(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: json['data'] == null
          ? null
          : AddItem.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddCartToJson(AddCart instance) => <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

AddItem _$AddItemFromJson(Map<String, dynamic> json) => AddItem(
      product: json['product'] == null
          ? null
          : CartProduct.fromJson(json['product'] as Map<String, dynamic>),
      total: json['total'],
      total_product_count: json['total_product_count'],
      total_price: json['total_price'],
    );

Map<String, dynamic> _$AddItemToJson(AddItem instance) => <String, dynamic>{
      'product': instance.product,
      'total': instance.total,
      'total_product_count': instance.total_product_count,
      'total_price': instance.total_price,
    };

CartProduct _$CartProductFromJson(Map<String, dynamic> json) => CartProduct(
      product_id: json['product_id'],
      name: json['name'],
      quantity: json['quantity'],
    );

Map<String, dynamic> _$CartProductToJson(CartProduct instance) =>
    <String, dynamic>{
      'product_id': instance.product_id,
      'name': instance.name,
      'quantity': instance.quantity,
    };
