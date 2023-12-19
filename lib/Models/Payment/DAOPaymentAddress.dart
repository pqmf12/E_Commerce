import 'package:json_annotation/json_annotation.dart';
part 'DAOPaymentAddress.g.dart';

@JsonSerializable()
class DAOPaymentAddress {
  int? success;
  List<dynamic>? error;
  AddressData? data;

  DAOPaymentAddress({
    this.success,
    this.error,
    this.data,
  });

  factory  DAOPaymentAddress.fromJson(Map<String, dynamic> json) =>
      _$DAOPaymentAddressFromJson(json);
  Map<String, dynamic> toJson() => _$DAOPaymentAddressToJson(this);

}

@JsonSerializable()
class AddressData {
  String? address_id;
  List<AddressDetails>? addresses;

  AddressData({
    this.address_id,
    this.addresses,
   });

  factory AddressData.fromJson(Map<String, dynamic> json) =>
      _$AddressDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDataToJson(this);
}

@JsonSerializable()
class AddressDetails {
  dynamic address_id;
  dynamic firstname;
  dynamic lastname;
  dynamic company;
  dynamic address_1;
  dynamic address_2;
  dynamic postcode;
  dynamic city;
  dynamic zone_id;
  dynamic zone;
  dynamic zone_code;
  dynamic country_id;
  dynamic country;
  dynamic iso_code_2;
  dynamic iso_code_3;
  dynamic address_format;
  dynamic custom_field;

  AddressDetails({
    this.address_id,
    this.firstname,
    this.lastname,
    this.company,
    this.address_1,
    this.address_2,
    this.postcode,
    this.city,
    this.zone_id,
    this.zone,
    this.zone_code,
    this.country_id,
    this.country,
    this.iso_code_2,
    this.iso_code_3,
    this.address_format,
    this.custom_field,
  });

  factory AddressDetails.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$AddressDetailsToJson(this);
}