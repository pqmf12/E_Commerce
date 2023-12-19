// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DAOPaymentAddress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DAOPaymentAddress _$DAOPaymentAddressFromJson(Map<String, dynamic> json) =>
    DAOPaymentAddress(
      success: json['success'] as int?,
      error: json['error'] as List<dynamic>?,
      data: json['data'] == null
          ? null
          : AddressData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DAOPaymentAddressToJson(DAOPaymentAddress instance) =>
    <String, dynamic>{
      'success': instance.success,
      'error': instance.error,
      'data': instance.data,
    };

AddressData _$AddressDataFromJson(Map<String, dynamic> json) => AddressData(
      address_id: json['address_id'] as String?,
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddressDataToJson(AddressData instance) =>
    <String, dynamic>{
      'address_id': instance.address_id,
      'addresses': instance.addresses,
    };

AddressDetails _$AddressDetailsFromJson(Map<String, dynamic> json) =>
    AddressDetails(
      address_id: json['address_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      company: json['company'],
      address_1: json['address_1'],
      address_2: json['address_2'],
      postcode: json['postcode'],
      city: json['city'],
      zone_id: json['zone_id'],
      zone: json['zone'],
      zone_code: json['zone_code'],
      country_id: json['country_id'],
      country: json['country'],
      iso_code_2: json['iso_code_2'],
      iso_code_3: json['iso_code_3'],
      address_format: json['address_format'],
      custom_field: json['custom_field'],
    );

Map<String, dynamic> _$AddressDetailsToJson(AddressDetails instance) =>
    <String, dynamic>{
      'address_id': instance.address_id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'company': instance.company,
      'address_1': instance.address_1,
      'address_2': instance.address_2,
      'postcode': instance.postcode,
      'city': instance.city,
      'zone_id': instance.zone_id,
      'zone': instance.zone,
      'zone_code': instance.zone_code,
      'country_id': instance.country_id,
      'country': instance.country,
      'iso_code_2': instance.iso_code_2,
      'iso_code_3': instance.iso_code_3,
      'address_format': instance.address_format,
      'custom_field': instance.custom_field,
    };
