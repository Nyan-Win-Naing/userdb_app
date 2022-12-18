import 'package:json_annotation/json_annotation.dart';
import 'package:user_db_app/data/vos/geo_vo.dart';
import 'package:hive/hive.dart';
import 'package:user_db_app/persistence/hive_constants.dart';

part 'address_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_ADDRESS_VO, adapterName: "AddressVOAdapter")
class AddressVO {
  @JsonKey(name: "street")
  @HiveField(0)
  String? street;

  @JsonKey(name: "suite")
  @HiveField(1)
  String? suite;

  @JsonKey(name: "city")
  @HiveField(2)
  String? city;

  @JsonKey(name: "zipcode")
  @HiveField(3)
  String? zipCode;

  @JsonKey(name: "geo")
  @HiveField(4)
  GeoVO? geo;

  AddressVO({
    this.street,
    this.suite,
    this.city,
    this.zipCode,
    this.geo,
  });

  factory AddressVO.fromJson(Map<String, dynamic> json) => _$AddressVOFromJson(json);

  Map<String, dynamic> toJson() => _$AddressVOToJson(this);
}
