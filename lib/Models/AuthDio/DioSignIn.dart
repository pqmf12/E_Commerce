import 'package:json_annotation/json_annotation.dart';

part 'DioSignIn.g.dart';

@JsonSerializable()
class DioSignIn {
  int? success;
  List? error;
  UserInfo? data;

  DioSignIn({
    this.success,
    this.error,
    this.data,
  });

  factory DioSignIn.fromJson(Map<String, dynamic> json) =>
      _$DioSignInFromJson(json);

  Map<String, dynamic> toJson() => _$DioSignInToJson(this);
}

@JsonSerializable()
class  UserInfo{
  dynamic customer_id;
  dynamic customer_group_id;
  dynamic store_id;
  dynamic language_id;
  dynamic firstname ;
  dynamic lastname;
  dynamic email ;
  dynamic telephone ;
  dynamic fax ;
  dynamic cart;
  dynamic wishlist;
  dynamic newsletter;
  dynamic address_id;
  dynamic custom_field;
  dynamic ip;
  dynamic status;
  dynamic approved;
  dynamic safe;
  dynamic code;
  dynamic date_added;
  dynamic custom_fields;
   dynamic account_custom_field;
  dynamic wishlist_total;
  dynamic cart_count_products;

  UserInfo({
    this.customer_id,
    this.customer_group_id,
    this.store_id,
    this.language_id,
    this.firstname ,
    this.lastname,
    this.email ,
    this.telephone ,
    this.fax ,
    this.cart,
    this.wishlist,
    this.newsletter,
    this.address_id,
    this.custom_field,
    this.ip,
    this.status,
    this.approved,
    this.safe,
    this.code,
    this.date_added,
    this.custom_fields,
    this.account_custom_field,
    this.wishlist_total,
    this.cart_count_products,
  });

  factory  UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

