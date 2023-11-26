import 'package:json_annotation/json_annotation.dart';

part 'AddCart.g.dart';

@JsonSerializable()
class AddCart {
  int? success;
  List? error;
  AddItem? data;

  AddCart({
    this.success,
    this.error,
    this.data,
  });

  factory AddCart.fromJson(Map<String, dynamic> json) =>
      _$AddCartFromJson(json);

  Map<String, dynamic> toJson() => _$AddCartToJson(this);
}

@JsonSerializable()
class AddItem{
 CartProduct? product;
 dynamic total;
 dynamic total_product_count;
 dynamic total_price;

  AddItem({
    this.product,
    this.total,
    this.total_product_count,
    this.total_price,
  });

  factory AddItem.fromJson(Map<String, dynamic> json) =>
      _$AddItemFromJson(json);

  Map<String, dynamic> toJson() => _$AddItemToJson(this);
}

@JsonSerializable()
class CartProduct{

  dynamic product_id;
  dynamic name;
  dynamic quantity;

  CartProduct({
   this.product_id,
   this.name,
   this.quantity,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductToJson(this);
}

