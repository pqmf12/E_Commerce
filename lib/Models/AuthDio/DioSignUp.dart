import 'package:json_annotation/json_annotation.dart';

part 'DioSignUp.g.dart';

@JsonSerializable()
class DioSignUp {
  int? success;
  List? error;
  List? data;

  DioSignUp({
    this.success,
    this.error,
    this.data,
  });

  factory DioSignUp.fromJson(Map<String, dynamic> json) =>
      _$DioSignUpFromJson(json);

  Map<String, dynamic> toJson() => _$DioSignUpToJson(this);
}
