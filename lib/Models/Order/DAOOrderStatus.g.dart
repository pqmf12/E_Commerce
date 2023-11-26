// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOOrderStatus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOOrderStatus _$DAOOrderStatusFromJson(Map<String, dynamic> json) =>
    DAOOrderStatus(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OrderList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DAOOrderStatusToJson(DAOOrderStatus instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

OrderList _$OrderListFromJson(Map<String, dynamic> json) => OrderList(
      order_status_id: json['order_status_id'],
      name: json['name'],
    );

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
      'order_status_id': instance.order_status_id,
      'name': instance.name,
    };
