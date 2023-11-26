import 'package:json_annotation/json_annotation.dart';

part 'DAOBannerDetail.g.dart';

@JsonSerializable()
class DAOBannerDetail{
  int? success;
  List? error;
  List<BannerData>? data;

  DAOBannerDetail({
    this.success,
    this.error,
    this.data,
  });

  factory DAOBannerDetail.fromJson(Map<String, dynamic> json) =>
      _$DAOBannerDetailFromJson(json);
  Map<String, dynamic> toJson() => _$DAOBannerDetailToJson(this);

}

@JsonSerializable()
class BannerData{
 dynamic title;
 dynamic link;
 dynamic image;

  BannerData({
    this.title,
    this.link,
    this.image,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) =>
      _$BannerDataFromJson(json);
  Map<String, dynamic> toJson() => _$BannerDataToJson(this);

}