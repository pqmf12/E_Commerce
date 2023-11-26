import 'package:json_annotation/json_annotation.dart';

part 'DAOManufactures.g.dart';

@JsonSerializable()
class DAOManufactures{
  int? success;
  List? error;
  List<ManufacturerList>? data;

  DAOManufactures({
    this.success,
    this.error,
    this.data,
  });

  factory DAOManufactures.fromJson(Map<String, dynamic> json) =>
      _$DAOManufacturesFromJson(json);

  Map<String, dynamic> toJson() => _$DAOManufacturesToJson(this);
}

@JsonSerializable()
class ManufacturerList{
 dynamic manufacturer_id;
 dynamic name;
 dynamic image;
 dynamic original_image;
 dynamic sort_order ;

  ManufacturerList({
    this.manufacturer_id,
    this.name,
    this.image,
    this.original_image,
    this.sort_order,
  });

  factory ManufacturerList.fromJson(Map<String, dynamic> json) =>
      _$ManufacturerListFromJson(json);

  Map<String, dynamic> toJson() => _$ManufacturerListToJson(this);
}