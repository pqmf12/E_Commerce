import 'package:json_annotation/json_annotation.dart';

part 'DAOSubCategory.g.dart';

@JsonSerializable()
class DAOSubCategory{
  int? success;
  List? error;
  Data? data;

  DAOSubCategory({
    this.success,
    this.error,
    this.data,
  });

  factory DAOSubCategory.fromJson(Map<String, dynamic> json) =>
      _$DAOSubCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$DAOSubCategoryToJson(this);
}

@JsonSerializable()
class Data{
  dynamic id;
  dynamic name ;
  dynamic description;
  dynamic image;
  dynamic original_image;
  dynamic filters ;
  List<subcategories>? sub_categories;

  Data({
    this.id,
    this.name ,
    this.description,
    this.image,
    this.original_image,
    this.filters ,
    this.sub_categories,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

}

@JsonSerializable()
class subcategories{
  dynamic category_id;
  dynamic parent_id;
  dynamic name;
  dynamic image;
  dynamic original_image;
  dynamic filters;
  dynamic categories;

  subcategories({
   this.category_id,
   this.parent_id,
   this.name,
   this.image  ,
   this.original_image,
   this.filters,
   this.categories,
  });

  factory subcategories.fromJson(Map<String, dynamic> json) =>
      _$subcategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$subcategoriesToJson(this);
}