// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RawData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RawData _$RawDataFromJson(Map<String, dynamic> json) => RawData(
      lastname: json['lastname'] as String?,
      firstname: json['firstname'] as String?,
      confirm: json['confirm'] as String?,
      telephone: json['telephone'] as String?,
      city: json['city'] as String?,
      address_1: json['address_1'] as String?,
      country_id: json['country_id'] as int?,
      postcode: json['postcode'] as String?,
      agree: json['agree'] as int?,
      zone_id: json['zone_id'] as int?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      fax: json['fax'] as String?,
      company_id: json['company_id'] as String?,
      company: json['company'] as String?,
      address_2: json['address_2'] as String?,
      tax_id: json['tax_id'] as int?,
      customer_group_id: json['customer_group_id'] as int?,
      custom_field: (json['custom_field'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Map<String, String>.from(e as Map)),
      ),
    );

Map<String, dynamic> _$RawDataToJson(RawData instance) => <String, dynamic>{
      'lastname': instance.lastname,
      'firstname': instance.firstname,
      'confirm': instance.confirm,
      'telephone': instance.telephone,
      'city': instance.city,
      'address_1': instance.address_1,
      'country_id': instance.country_id,
      'postcode': instance.postcode,
      'agree': instance.agree,
      'zone_id': instance.zone_id,
      'email': instance.email,
      'password': instance.password,
      'fax': instance.fax,
      'company_id': instance.company_id,
      'company': instance.company,
      'address_2': instance.address_2,
      'tax_id': instance.tax_id,
      'customer_group_id': instance.customer_group_id,
      'custom_field': instance.custom_field,
    };
