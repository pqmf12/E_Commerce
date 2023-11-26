import 'package:json_annotation/json_annotation.dart';

part 'DAOCompare.g.dart';

@JsonSerializable()
class DAOCompare {
  int? success;
  List? error;
  List<Compareproducts>?  data;

  DAOCompare({
    this.success,
    this.error,
    this.data,
  });

  factory DAOCompare.fromJson(Map<String, dynamic> json) =>
      _$DAOCompareFromJson(json);

  Map<String, dynamic> toJson() => _$DAOCompareToJson(this);

}

@JsonSerializable()
class Compareproducts{
 dynamic product_id;
 dynamic name;
 dynamic thumb;
 dynamic price;
 dynamic special;
 dynamic description;
 dynamic model ;
 dynamic manufacturer;
 dynamic availability;
 dynamic minimum;
 dynamic rating;
 dynamic reviews;
 dynamic weight;
 dynamic length;
 dynamic width;
 dynamic height ;
 dynamic attribute;

  Compareproducts({
    this.product_id,
    this.name,
    this.thumb,
    this.price,
    this.special,
    this.description,
    this.model,
    this.manufacturer,
    this.availability,
    this.minimum,
    this.rating,
    this.reviews,
    this.weight,
    this.length,
    this.width,
    this.height,
    this.attribute,
  });

  factory Compareproducts.fromJson(Map<String, dynamic> json) =>
      _$CompareproductsFromJson(json);
  Map<String, dynamic> toJson() => _$CompareproductsToJson(this);

}