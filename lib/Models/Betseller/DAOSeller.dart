import 'package:json_annotation/json_annotation.dart';

part 'DAOSeller.g.dart';

@JsonSerializable()
class DAOSeller{
  int? success;
  List? error;
  List<SaleProduct>? data;

  DAOSeller({
    this.success,
    this.error,
    this.data,
});

  factory DAOSeller.fromJson(Map<String, dynamic> json) =>
      _$DAOSellerFromJson(json);
  Map<String, dynamic> toJson() => _$DAOSellerToJson(this);

}

@JsonSerializable()
class SaleProduct{

  dynamic product_id;
  dynamic thumb;
  dynamic name ;
  dynamic quantity;
  dynamic status;
  dynamic stock_status;
  dynamic price_excluding_tax;
  dynamic price_excluding_tax_formated;
  dynamic price;
  dynamic price_formated ;
  dynamic special;
  dynamic special_formated;
  dynamic special_excluding_tax;
  dynamic special_excluding_tax_formated;
  dynamic discounts;
  dynamic rating;
  dynamic description;

  SaleProduct({
    this.product_id,
    this.thumb,
    this.name ,
    this.quantity,
    this.status,
    this.stock_status,
    this.price_excluding_tax,
    this.price_excluding_tax_formated,
    this.price,
    this.price_formated ,
    this.special,
    this.special_formated,
    this.special_excluding_tax,
    this.special_excluding_tax_formated,
    this.discounts,
    this.rating,
    this.description,

  });

  factory SaleProduct.fromJson(Map<String, dynamic> json) =>
      _$SaleProductFromJson(json);
  Map<String, dynamic> toJson() => _$SaleProductToJson(this);

}