import 'package:json_annotation/json_annotation.dart';

part 'DAOBanner.g.dart';

@JsonSerializable()
class DAOBanner{
  int? success;
  List? error;
  List<BannerList>? data;

  DAOBanner({
    this.success,
    this.error,
    this.data,
  });

  factory DAOBanner.fromJson(Map<String, dynamic> json) =>
      _$DAOBannerFromJson(json);
  Map<String, dynamic> toJson() => _$DAOBannerToJson(this);

}

@JsonSerializable()
class BannerList{
 dynamic banner_id;
 dynamic name;
 dynamic status;
 dynamic checksum;

  BannerList({
    this.banner_id,
    this.name,
    this.status,
    this.checksum,
  });

  factory BannerList.fromJson(Map<String, dynamic> json) =>
      _$BannerListFromJson(json);
  Map<String, dynamic> toJson() => _$BannerListToJson(this);

}