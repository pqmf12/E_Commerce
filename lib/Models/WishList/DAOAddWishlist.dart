import 'package:json_annotation/json_annotation.dart';

part 'DAOAddWishlist.g.dart';

@JsonSerializable()
class DAOAddWishlist {
  int? success;
  List? error;
  List? data;

  DAOAddWishlist({
    this.success,
    this.error,
    this.data,
  });

  factory DAOAddWishlist.fromJson(Map<String, dynamic> json) =>
      _$DAOAddWishlistFromJson(json);

  Map<String, dynamic> toJson() => _$DAOAddWishlistToJson(this);
}
