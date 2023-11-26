import 'package:json_annotation/json_annotation.dart';

part 'DAOfeatured.g.dart';

@JsonSerializable()
class DAOfeatured{
  int? success;
  List? error;
  List<Featured>? data;

  DAOfeatured({
    this.success,
    this.error,
    this.data,
  });

  factory DAOfeatured.fromJson(Map<String, dynamic> json) =>
      _$DAOfeaturedFromJson(json);

  Map<String, dynamic> toJson() => _$DAOfeaturedToJson(this);
}

@JsonSerializable()
class Featured{
  dynamic module_id;
  dynamic name;
  dynamic code;
  List<featuredproduct>? products;

  Featured({
   this.module_id,
   this.name ,
   this.code ,
   this.products,
  });

  factory Featured.fromJson(Map<String, dynamic> json) =>
      _$FeaturedFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturedToJson(this);

}

@JsonSerializable()
class featuredproduct{
  dynamic product_id;
  dynamic thumb ;
  dynamic name;
  dynamic quantity ;
  dynamic status;
  dynamic stock_status;
  dynamic price_excluding_tax;
  dynamic price_excluding_tax_formated;
  dynamic price;
  dynamic price_formated;
  dynamic special;
  dynamic special_formated;
  dynamic special_excluding_tax;
  dynamic special_excluding_tax_formated;
  dynamic rating;
  dynamic special_start_date;
  dynamic special_end_date;
  dynamic description;

  featuredproduct({
     this.product_id,
     this.thumb ,
     this.name,
     this.quantity ,
     this.status,
     this.stock_status,
     this.price_excluding_tax,
     this.price_excluding_tax_formated,
     this.price,
     this.price_formated,
     this.special,
     this.special_formated,
     this.special_excluding_tax,
     this.special_excluding_tax_formated,
     this.rating,
     this.special_start_date,
     this.special_end_date,
     this.description,
  });

  factory featuredproduct.fromJson(Map<String, dynamic> json) =>
      _$featuredproductFromJson(json);
  Map<String, dynamic> toJson() => _$featuredproductToJson(this);

}

