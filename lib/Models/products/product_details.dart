import 'package:json_annotation/json_annotation.dart';

part 'product_details.g.dart';

@JsonSerializable()
class ProductDetail {
  int? success;
  List? error;
  Details?  data;

  ProductDetail({
    this.success,
    this.error,
    this.data,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);

}

@JsonSerializable()
class Details {
  dynamic id;
  dynamic product_id;
  dynamic name;
  dynamic manufacturer;
  dynamic sku;
  dynamic model;
  dynamic image;
  dynamic images;
  dynamic original_image;
  dynamic original_images;
  dynamic price_excluding_tax;
  dynamic price_excluding_tax_formated;
  dynamic price;
  dynamic price_formated;
  dynamic rating;
  dynamic description;
  dynamic attribute_groups;
  dynamic special;
  dynamic special_formated;
  dynamic special_excluding_tax;
  dynamic special_excluding_tax_formated;
  dynamic special_start_date;
  dynamic special_end_date;
  dynamic discounts;
  dynamic options;
  dynamic minimum;
  dynamic meta_title;
  dynamic meta_description;
  dynamic meta_keyword;
  dynamic tag;
  dynamic upc;
  dynamic ean;
  dynamic jan;
  dynamic isbn;
  dynamic mpn;
  dynamic location;
  dynamic stock_status;
  dynamic stock_status_id;
  dynamic manufacturer_id;
  dynamic tax_class_id;
  dynamic date_available;
  dynamic weight;
  dynamic weight_class_id;
  dynamic length;
  dynamic width;
  dynamic height;
  dynamic length_class_id;
  dynamic subtract;
  dynamic sort_order;
  dynamic status;
  dynamic date_added;
  dynamic date_modified;
  dynamic viewed;
  dynamic weight_class;
  dynamic length_class;
  dynamic shipping;
  dynamic reward;
  dynamic points;
  dynamic category;
  dynamic quantity;
  dynamic reviews;
  dynamic recurrings;

  Details({
    this.id,
    this.product_id,
    this.name,
    this.manufacturer,
    this.sku,
    this.model,
    this.image,
    this.images,
    this.original_image,
    this.original_images,
    this.price_excluding_tax,
    this.price_excluding_tax_formated,
    this.price,
    this.price_formated,
    this.rating,
    this.description,
    this.attribute_groups,
    this.special,
    this.special_formated,
    this.special_excluding_tax,
    this.special_excluding_tax_formated,
    this.special_start_date,
    this.special_end_date,
    this.discounts,
    this.options,
    this.minimum,
    this.meta_title,
    this.meta_description,
    this.meta_keyword,
    this.tag,
    this.upc,
    this.ean,
    this.jan,
    this.isbn,
    this.mpn,
    this.location,
    this.stock_status,
    this.stock_status_id,
    this.manufacturer_id,
    this.tax_class_id,
    this.date_available,
    this.weight,
    this.weight_class_id,
    this.length,
    this.width,
    this.height,
    this.length_class_id,
    this.subtract,
    this.sort_order,
    this.status,
    this.date_added,
    this.date_modified,
    this.viewed,
    this.weight_class,
    this.length_class,
    this.shipping,
    this.reward,
    this.points,
    this.category,
    this.quantity,
    this.reviews,
    this.recurrings,
  });

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsToJson(this);

}


