import 'package:json_annotation/json_annotation.dart';

part 'list_of_categories.g.dart';

@JsonSerializable()
class ListCategory {
  int? success;
  List? error;
  List<Categories>? data;

  ListCategory({
    this.success,
    this.error,
    this.data,
  });

  factory ListCategory.fromJson(Map<String, dynamic> json) =>
      _$ListCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ListCategoryToJson(this);

}

@JsonSerializable()
class Categories {
   dynamic category_id;
   dynamic parent_id;
   dynamic name ;
   dynamic image ;
   dynamic original_image ;
   dynamic filters;
   dynamic filter_groups;
   dynamic categories;

  Categories({
    this.category_id,
    this.parent_id,
    this.name ,
    this.image ,
    this.original_image ,
    this.filters,
    this.filter_groups,
    this.categories,
  });

  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
