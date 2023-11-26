import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account{
  int? success;
  List? error;
  Profile? data;

  Account({
    this.success,
    this.error,
    this.data,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

}

@JsonSerializable()
class Profile{

  dynamic customer_id;
  dynamic customer_group_id;
  dynamic store_id;
  dynamic language_id;
  dynamic firstname;
  dynamic lastname;
  dynamic email;
  dynamic telephone;
  dynamic fax;
  dynamic cart;
  dynamic wishlist;
  dynamic newsletter;
  dynamic address_id;
  dynamic ip;
  dynamic status;
  dynamic approved;
  dynamic safe;
  dynamic token;
  dynamic code;
  dynamic date_added;
  dynamic custom_fields;
  dynamic account_custom_field;
  dynamic reward_total;
  dynamic user_balance;

  Profile({

    this.customer_id,
    this.customer_group_id,
    this.store_id,
    this.language_id,
    this.firstname,
    this.lastname,
    this.email,
    this.telephone,
    this.fax,
    this.cart,
    this.wishlist,
    this.newsletter,
    this.address_id,
    this.ip,
    this.status,
    this.approved,
    this.safe,
    this.token,
    this.code,
    this.date_added,
    this.custom_fields,
    this.account_custom_field,
    this.reward_total,
    this.user_balance,

  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

}