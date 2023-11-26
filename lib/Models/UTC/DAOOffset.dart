import 'package:json_annotation/json_annotation.dart';

part 'DAOOffset.g.dart';

@JsonSerializable()
class DAOOffset {
  int? success;
  List? error;
  Utc? data;

  DAOOffset({
    this.success,
    this.error,
    this.data,
  });

  factory DAOOffset.fromJson(Map<String, dynamic> json) =>
      _$DAOOffsetFromJson(json);

  Map<String, dynamic> toJson() => _$DAOOffsetToJson(this);
}


@JsonSerializable()
class Utc {

  dynamic offset;

  Utc({
    this.offset,
  });

  factory Utc.fromJson(Map<String, dynamic> json) =>
      _$UtcFromJson(json);

  Map<String, dynamic> toJson() => _$UtcToJson(this);
}