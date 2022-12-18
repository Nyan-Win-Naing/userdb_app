import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:user_db_app/persistence/hive_constants.dart';

part 'company_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_COMPANY_VO, adapterName: "CompanyVOAdapter")
class CompanyVO {
  @JsonKey(name: "name")
  @HiveField(0)
  String? name;

  @JsonKey(name: "catchPhrase")
  @HiveField(1)
  String? catchPhrase;

  @JsonKey(name: "bs")
  @HiveField(2)
  String? bs;

  CompanyVO({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory CompanyVO.fromJson(Map<String, dynamic> json) => _$CompanyVOFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyVOToJson(this);
}
