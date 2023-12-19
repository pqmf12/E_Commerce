// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAODeleteCart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAODeleteCart _$DAODeleteCartFromJson(Map<String, dynamic> json) =>
    DAODeleteCart(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: json['data'] == null
          ? null
          : DeleteData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DAODeleteCartToJson(DAODeleteCart instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

DeleteData _$DeleteDataFromJson(Map<String, dynamic> json) => DeleteData(
      total: json['total'] as String?,
      total_product_count: json['total_product_count'] as int?,
      total_price: json['total_price'] as String?,
    );

Map<String, dynamic> _$DeleteDataToJson(DeleteData instance) =>
    <String, dynamic>{
      'total': instance.total,
      'total_product_count': instance.total_product_count,
      'total_price': instance.total_price,
    };
