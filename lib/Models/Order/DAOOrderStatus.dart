import 'package:json_annotation/json_annotation.dart';

part 'DAOOrderStatus.g.dart';

@JsonSerializable()
class DAOOrderStatus{
  int? success;
  List? error;
  List<OrderList>? data;

  DAOOrderStatus({
    this.success,
    this.error,
    this.data,
  });

  factory DAOOrderStatus.fromJson(Map<String, dynamic> json) =>
      _$DAOOrderStatusFromJson(json);

  Map<String, dynamic> toJson() => _$DAOOrderStatusToJson(this);
}

@JsonSerializable()
class OrderList{
  dynamic order_status_id;
  dynamic name;

  OrderList({
    this.order_status_id,
    this.name,

  });

  factory OrderList.fromJson(Map<String, dynamic> json) =>
      _$OrderListFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListToJson(this);
}