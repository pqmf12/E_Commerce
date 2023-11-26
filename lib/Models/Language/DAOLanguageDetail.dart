import 'package:json_annotation/json_annotation.dart';

part 'DAOLanguageDetail.g.dart';

@JsonSerializable()
class LanguageDetail{
  int? success;
  List? error;
  LangDetail? data;

  LanguageDetail({
    this.success,
    this.error,
    this.data,
  });

  factory LanguageDetail.fromJson(Map<String, dynamic> json) =>
      _$LanguageDetailFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageDetailToJson(this);
}

@JsonSerializable()
class LangDetail{
  dynamic language_id;
  dynamic name;
  dynamic code;
  dynamic locale ;
  dynamic image;
  dynamic directory;
  dynamic filename;
  dynamic sort_order;
  dynamic status;

  LangDetail({
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

  factory LangDetail.fromJson(Map<String, dynamic> json) =>
      _$LangDetailFromJson(json);

  Map<String, dynamic> toJson() => _$LangDetailToJson(this);
}