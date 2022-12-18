import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:user_db_app/data/vos/address_vo.dart';
import 'package:user_db_app/data/vos/company_vo.dart';
import 'package:user_db_app/persistence/hive_constants.dart';

part 'user_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_USER_VO, adapterName: "UserVOAdapter")
class UserVO {
  @JsonKey(name: "id")
  @HiveField(0)
  int? id;

  @JsonKey(name: "name")
  @HiveField(1)
  String? name;

  @JsonKey(name: "username")
  @HiveField(2)
  String? username;

  @JsonKey(name: "email")
  @HiveField(3)
  String? email;

  @JsonKey(name: "address")
  @HiveField(4)
  AddressVO? address;

  @JsonKey(name: "phone")
  @HiveField(5)
  String? phone;

  @JsonKey(name: "website")
  @HiveField(6)
  String? website;

  @JsonKey(name: "company")
  @HiveField(7)
  CompanyVO? company;

  UserVO({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory UserVO.fromJson(Map<String, dynamic> json) => _$UserVOFromJson(json);

  Map<String, dynamic> toJson() => _$UserVOToJson(this);
}
