import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class session{
  int? success;
  List? error;
  Data? data;

  session({
    this.success,
    this.error,
    this.data,
  });

  factory session.fromJson(Map<String, dynamic> json) =>
      _$sessionFromJson(json);

  Map<String, dynamic> toJson() => _$sessionToJson(this);

}


@JsonSerializable()
class Data{
  dynamic session;

  Data({
    this.session,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

