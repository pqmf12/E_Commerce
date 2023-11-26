import 'package:json_annotation/json_annotation.dart';

part 'categories.g.dart';

@JsonSerializable()
class categories {
  int? success;
  List? error;
  List<category>? data;

  categories({
    this.success,
    this.error,
    this.data,
  });

  factory categories.fromJson(Map<String, dynamic> json) =>
      _$categoriesFromJson(json);

  Map<String, dynamic> toJson() => _$categoriesToJson(this);
}

@JsonSerializable()
class category {
  dynamic id;
  dynamic name;
  dynamic description;
  dynamic image;
  dynamic original_image;
  dynamic status;
  dynamic parent_id;
  dynamic filters;

  category({
    this.id,
    this.name,
    this.description,
    this.image ,
    this.original_image,
    this.status,
    this.parent_id,
    this.filters,
  });

  factory category.fromJson(Map<String, dynamic> json) =>
      _$categoryFromJson(json);

  Map<String, dynamic> toJson() => _$categoryToJson(this);
}
