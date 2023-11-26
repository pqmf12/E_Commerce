import 'package:json_annotation/json_annotation.dart';

part 'DAOSpecialProducts.g.dart';

@JsonSerializable()
class DAOSpecialProducts{
  int? success;
  List? error;
  List<SpecialProduct>? data;

  DAOSpecialProducts({
    this.success,
    this.error,
    this.data,
  });

  factory DAOSpecialProducts.fromJson(Map<String, dynamic> json) =>
      _$DAOSpecialProductsFromJson(json);

  Map<String, dynamic> toJson() => _$DAOSpecialProductsToJson(this);
}

@JsonSerializable()
class SpecialProduct{
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

  SpecialProduct({
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

  factory SpecialProduct.fromJson(Map<String, dynamic> json) =>
      _$SpecialProductFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialProductToJson(this);

}

