import 'package:json_annotation/json_annotation.dart';

part 'DAOGetWishlist.g.dart';

@JsonSerializable()
class DAOGetWishlist {
  int? success;
  List? error;
  List<WishlistProduct>? data;

  DAOGetWishlist({
    this.success,
    this.error,
    this.data,
  });

  factory DAOGetWishlist.fromJson(Map<String, dynamic> json) =>
      _$DAOGetWishlistFromJson(json);

  Map<String, dynamic> toJson() => _$DAOGetWishlistToJson(this);
}

@JsonSerializable()
class WishlistProduct {
 dynamic product_id;
 dynamic thumb;
 dynamic name;
 dynamic model;
 dynamic stock;
 dynamic price;
 dynamic special;

  WishlistProduct({
    this.product_id,
    this.thumb,
    this.name,
    this.model,
    this.stock,
    this.price,
    this.special,

  });

  factory WishlistProduct.fromJson(Map<String, dynamic> json) =>
      _$WishlistProductFromJson(json);

  Map<String, dynamic> toJson() => _$WishlistProductToJson(this);
}
