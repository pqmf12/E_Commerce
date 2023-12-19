import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'DAOCart.g.dart';

@JsonSerializable()
class DAOCart {
  int? success;
  List<dynamic>? error;
  dynamic data;

  DAOCart({
    this.success,
    this.error,
    this.data,
});

  factory  DAOCart.fromJson(Map<String, dynamic> json) =>
      _$DAOCartFromJson(json);
  Map<String, dynamic> toJson() => _$DAOCartToJson(this);

}

@JsonSerializable()
class ApiData {
  String? weight;
  List<ProductData>? products;
  List? vouchers;
  String? coupon_status;
  String? coupon;
  String? voucher_status;
  String? voucher;
  bool? reward_status;
  String? reward;
  List<Total>? totals;
  String? total;
  double? total_raw;
  int? total_product_count;
  int? has_shipping;
  int? has_download;
  int? has_recurring_products;
  Currency? currency;

  ApiData({
    this.weight,
    this.products,
    this.vouchers,
    this.coupon_status,
    this.coupon,
    this.voucher_status,
    this.voucher,
    this.reward_status,
      this.reward,
      this.totals,
      this.total,
      this.total_raw,
    this.total_product_count,
    this.has_shipping,
    this.has_download,
    this.has_recurring_products,
    this.currency,
});

  factory ApiData.fromJson(Map<String, dynamic> json) =>
      _$ApiDataFromJson(json);

  Map<String, dynamic> toJson() => _$ApiDataToJson(this);
}

@JsonSerializable()
class ProductData {
  String? key;
  String? thumb;
  String? name;
  int? points;
  String? product_id;
  String? model;
  List? option;
  String? quantity;
  bool? stock;
  String? reward;
  String? price;
  String? recurring;
  String? total;
  double? price_raw;
  double? total_raw;

  ProductData({
   this.key,
   this.thumb,
   this.name,
   this.points,
   this.product_id,
   this.model,
   this.option,
   this.quantity,
   this.stock,
   this.reward,
   this.price,
   this.recurring,
   this.total,
   this.price_raw,
   this.total_raw,
});

  factory ProductData.fromJson(Map<String, dynamic> json) =>
      _$ProductDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}

@JsonSerializable()
class Total {
  String? title;
  String? text;
  double? value;

  Total({
   this.title,
   this.text,
   this.value,
});

  factory Total.fromJson(Map<String, dynamic> json) => _$TotalFromJson(json);

  Map<String, dynamic> toJson() => _$TotalToJson(this);
}

@JsonSerializable()
class Currency {
  String? currency_id;
  String? symbol_left;
  String? symbol_right;
  String? decimal_place;
  String? value;

  Currency({
   this.currency_id,
   this.symbol_left,
   this.symbol_right,
   this.decimal_place,
   this.value,

  });

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
