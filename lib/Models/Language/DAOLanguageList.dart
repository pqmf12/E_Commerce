import 'package:json_annotation/json_annotation.dart';

part 'DAOLanguageList.g.dart';

@JsonSerializable()
class DAOLanguageList{
  int? success;
  List? error;
  List<LangList>? data;

  DAOLanguageList({
    this.success,
    this.error,
    this.data,
  });

  factory DAOLanguageList.fromJson(Map<String, dynamic> json) =>
      _$DAOLanguageListFromJson(json);

  Map<String, dynamic> toJson() => _$DAOLanguageListToJson(this);
}

@JsonSerializable()
class LangList{
  dynamic language_id;
  dynamic name;
  dynamic code;
  dynamic locale ;
  dynamic image;
  dynamic directory;
  dynamic filename;
  dynamic sort_order;
  dynamic status;

  LangList({
    this.language_id,
    this.name,
    this.code,
    this.locale,
    this.image,
    this.directory,
    this.filename,
    this.sort_order,
    this.status,

  });

  factory LangList.fromJson(Map<String, dynamic> json) =>
      _$LangListFromJson(json);

  Map<String, dynamic> toJson() => _$LangListToJson(this);
}