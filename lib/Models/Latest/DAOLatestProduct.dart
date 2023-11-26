import 'package:json_annotation/json_annotation.dart';

part 'DAOLatestProduct.g.dart';

@JsonSerializable()
class DAOLatestProduct{
  int? success;
  List? error;
  List<LatestProduct>? data;

  DAOLatestProduct({
    this.success,
    this.error,
    this.data,
  });

  factory DAOLatestProduct.fromJson(Map<String, dynamic> json) =>
      _$DAOLatestProductFromJson(json);

  Map<String, dynamic> toJson() => _$DAOLatestProductToJson(this);
}

@JsonSerializable()
class LatestProduct{
  dynamic product_id;
  dynamic thumb ;
  dynamic name;
  dynamic quantity ;
  dynamic status;
  dynamic stock_status;
  dynamic price_excluding_tax;
  dynamic price_excluding_tax_formated;
  dynamic price;
  dynamic price_formated;
  dynamic special;
  dynamic special_formated;
  dynamic special_excluding_tax;
  dynamic special_excluding_tax_formated;
  dynamic discounts;
  dynamic rating;
  dynamic description;

  LatestProduct({
    this.product_id,
    this.thumb ,
    this.name,
    this.quantity ,
    this.status,
    this.stock_status,
    this.price_excluding_tax,
    this.price_excluding_tax_formated,
    this.price,
    this.price_formated,
    this.special,
    this.special_formated,
    this.special_excluding_tax,
    this.special_excluding_tax_formated,
    this.discounts,
    this.rating,
    this.description,
  });

  factory LatestProduct.fromJson(Map<String, dynamic> json) =>
      _$LatestProductFromJson(json);
  Map<String, dynamic> toJson() => _$LatestProductToJson(this);

}

