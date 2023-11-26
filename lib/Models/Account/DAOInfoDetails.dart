import 'package:json_annotation/json_annotation.dart';

part 'DAOInfoDetails.g.dart';

@JsonSerializable()
class DAOInfoDetails{
  int? success;
  List? error;
  Details? data;

  DAOInfoDetails({
    this.success,
    this.error,
    this.data,
  });

  factory DAOInfoDetails.fromJson(Map<String, dynamic> json) =>
      _$DAOInfoDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DAOInfoDetailsToJson(this);
}

@JsonSerializable()
class Details{
  dynamic information_id;
  dynamic bottom ;
  dynamic sort_order ;
  dynamic status ;
  dynamic language_id ;
  dynamic title ;
  dynamic description ;
  dynamic meta_title ;
  dynamic meta_description;
  dynamic meta_keyword ;
  dynamic store_id;

  Details({
    this.information_id,
    this.bottom ,
    this.sort_order ,
    this.status ,
    this.language_id ,
    this.title ,
    this.description ,
    this.meta_title ,
    this.meta_description,
    this.meta_keyword ,
    this.store_id,

  });

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);

  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}