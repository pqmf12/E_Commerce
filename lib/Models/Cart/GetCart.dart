import 'package:json_annotation/json_annotation.dart';

part 'GetCart.g.dart';

@JsonSerializable()
class GetCart {
  int? success;
  List? error;
  List<AddItem>? data;

  GetCart({
    this.success,
    this.error,
    this.data,
  });

  factory GetCart.fromJson(Map<String, dynamic> json) =>
      _$GetCartFromJson(json);

  Map<String, dynamic> toJson() => _$GetCartToJson(this);
}

@JsonSerializable()
class AddItem {
  dynamic weight;
  List<ProductList>? products;
  // dynamic products;
  List? vouchers;
  dynamic coupon_status;
  dynamic coupon;
  dynamic voucher_status;
  dynamic voucher;
  dynamic reward_status;
  dynamic reward;
  List<Sum>? totals;
  // dynamic totals;
  dynamic total;
  dynamic total_raw;
  dynamic total_product_count;
  dynamic has_shipping;
  dynamic has_download;
  dynamic has_recurring_products;
  Currency? currency;
  // dynamic currency;

  AddItem({
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

  factory AddItem.fromJson(Map<String, dynamic> json) =>
      _$AddItemFromJson(json);

  Map<String, dynamic> toJson() => _$AddItemToJson(this);
}

@JsonSerializable()
class ProductList {
  dynamic key ;
  dynamic thumb;
  dynamic name;
  dynamic points;
  dynamic product_id;
  dynamic model ;
  List? option ;
  dynamic quantity ;
  dynamic stock ;
  dynamic reward ;
  dynamic price;
  dynamic recurring;
  dynamic total;
  dynamic price_raw ;
  dynamic total_raw;

  ProductList({
    this.key ,
    this.thumb,
    this.name,
    this.points,
    this.product_id,
    this.model ,
    this.option ,
    this.quantity ,
    this.stock ,
    this.reward ,
    this.price,
    this.recurring,
    this.total,
    this.price_raw ,
    this.total_raw,
 });

  factory ProductList.fromJson(Map<String, dynamic> json) =>
      _$ProductListFromJson(json);

  Map<String, dynamic> toJson() => _$ProductListToJson(this);

}

@JsonSerializable()
class Sum {
  dynamic title;
  dynamic text;
  dynamic value;

  Sum({
     this.title,
     this.text,
     this.value,
  });
  factory Sum.fromJson(Map<String, dynamic> json) =>
      _$SumFromJson(json);

  Map<String, dynamic> toJson() => _$SumToJson(this);
}

@JsonSerializable()
class Currency{

  dynamic currency_id;
  dynamic symbol_left;
  dynamic symbol_right;
  dynamic decimal_place;
  dynamic value;

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


