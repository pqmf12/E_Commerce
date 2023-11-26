import 'package:json_annotation/json_annotation.dart';

part 'DAOInformation.g.dart';

@JsonSerializable()
class DAOInformation{
  int? success;
  List? error;
  List<InformationList>? data;

  DAOInformation({
    this.success,
    this.error,
    this.data,
  });

  factory DAOInformation.fromJson(Map<String, dynamic> json) =>
      _$DAOInformationFromJson(json);

  Map<String, dynamic> toJson() => _$DAOInformationToJson(this);
}

@JsonSerializable()
class InformationList{
  dynamic  id;
  dynamic title;

  InformationList({
    this.id,
    this.title,

  });

  factory InformationList.fromJson(Map<String, dynamic> json) =>
      _$InformationListFromJson(json);

  Map<String, dynamic> toJson() => _$InformationListToJson(this);
}