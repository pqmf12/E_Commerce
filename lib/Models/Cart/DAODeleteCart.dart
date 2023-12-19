import 'package:json_annotation/json_annotation.dart';

part 'DAODeleteCart.g.dart';

@JsonSerializable()
class DAODeleteCart{
  int? success;
  List<dynamic>? error;
  DeleteData? data;

  DAODeleteCart({
    this.success,
    this.error,
    this.data,
  });

  factory  DAODeleteCart.fromJson(Map<String, dynamic> json) =>
      _$DAODeleteCartFromJson(json);
  Map<String, dynamic> toJson() => _$DAODeleteCartToJson(this);

}

@JsonSerializable()
class DeleteData{
  String? total;
  int? total_product_count;
  String? total_price ;

  DeleteData({
    this.total,
    this.total_product_count,
    this.total_price,
  });

  factory  DeleteData.fromJson(Map<String, dynamic> json) =>
      _$DeleteDataFromJson(json);
  Map<String, dynamic> toJson() => _$DeleteDataToJson(this);

}
