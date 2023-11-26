// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: json['data'] == null
          ? null
          : Profile.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
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
      ip: json['ip'],
      status: json['status'],
      approved: json['approved'],
      safe: json['safe'],
      token: json['token'],
      code: json['code'],
      date_added: json['date_added'],
      custom_fields: json['custom_fields'],
      account_custom_field: json['account_custom_field'],
      reward_total: json['reward_total'],
      user_balance: json['user_balance'],
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
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
      'ip': instance.ip,
      'status': instance.status,
      'approved': instance.approved,
      'safe': instance.safe,
      'token': instance.token,
      'code': instance.code,
      'date_added': instance.date_added,
      'custom_fields': instance.custom_fields,
      'account_custom_field': instance.account_custom_field,
      'reward_total': instance.reward_total,
      'user_balance': instance.user_balance,
    };
