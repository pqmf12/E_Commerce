import 'package:json_annotation/json_annotation.dart';

part 'RawData.g.dart';

@JsonSerializable()

class RawData {
  String? lastname;
  String? firstname;
  String? confirm;
  String? telephone;
  String? city;
  String? address_1;
  int? country_id;
  String? postcode;
  int? agree;
  int? zone_id;
  String? email;
  String? password;
  String? fax;
  String? company_id;
  String? company;
  String? address_2;
  int? tax_id;
  int? customer_group_id;
  Map<String, Map<String, String>>? custom_field;

  RawData({
    this.lastname,
    this.firstname,
    this.confirm,
    this.telephone,
    this.city,
    this.address_1,
    this.country_id,
    this. postcode,
    this.agree,
    this.zone_id,
    this.email,
    this.password,
    this.fax,
    this.company_id,
    this.company,
    this.address_2,
    this.tax_id,
    this.customer_group_id,
    this.custom_field,
});

  factory RawData.fromJson(Map<String, dynamic> json) =>
      _$RawDataFromJson(json);

  Map<String, dynamic> toJson() => _$RawDataToJson(this);

}
