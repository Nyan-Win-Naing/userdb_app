import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:user_db_app/persistence/hive_constants.dart';

part 'geo_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_GEO_VO, adapterName: "GeoVOAdapter")
class GeoVO {
  @JsonKey(name: "lat")
  @HiveField(0)
  String? lat;

  @JsonKey(name: "lng")
  @HiveField(1)
  String? lng;

  GeoVO({this.lat, this.lng});

  factory GeoVO.fromJson(Map<String, dynamic> json) => _$GeoVOFromJson(json);

  Map<String, dynamic> toJson() => _$GeoVOToJson(this);
}