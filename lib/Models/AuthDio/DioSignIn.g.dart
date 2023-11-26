// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DioSignIn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DioSignIn _$DioSignInFromJson(Map<String, dynamic> json) => DioSignIn(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: json['data'] == null
          ? null
          : UserInfo.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DioSignInToJson(DioSignIn instance) => <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      customer_id: json['customer_id'],
      customer_group_id: json['customer_group_id'],
      store_id: json['store_id'],
      language_id: json['language_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      telephone: json['telephone'],
      fax: json['fax'],
      cart: json['cart'],
      wishlist: json['wishlist'],
      newsletter: json['newsletter'],
      address_id: json['address_id'],
      custom_field: json['custom_field'],
      ip: json['ip'],
      status: json['status'],
      approved: json['approved'],
      safe: json['safe'],
      code: json['code'],
      date_added: json['date_added'],
      custom_fields: json['custom_fields'],
      account_custom_field: json['account_custom_field'],
      wishlist_total: json['wishlist_total'],
      cart_count_products: json['cart_count_products'],
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'customer_id': instance.customer_id,
      'customer_group_id': instance.customer_group_id,
      'store_id': instance.store_id,
      'language_id': instance.language_id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'telephone': instance.telephone,
      'fax': instance.fax,
      'cart': instance.cart,
      'wishlist': instance.wishlist,
      'newsletter': instance.newsletter,
      'address_id': instance.address_id,
      'custom_field': instance.custom_field,
      'ip': instance.ip,
      'status': instance.status,
      'approved': instance.approved,
      'safe': instance.safe,
      'code': instance.code,
      'date_added': instance.date_added,
      'custom_fields': instance.custom_fields,
      'account_custom_field': instance.account_custom_field,
      'wishlist_total': instance.wishlist_total,
      'cart_count_products': instance.cart_count_products,
    };
