// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyVOAdapter extends TypeAdapter<CompanyVO> {
  @override
  final int typeId = 2;

  @override
  CompanyVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyVO(
      name: fields[0] as String?,
      catchPhrase: fields[1] as String?,
      bs: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyVO obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.catchPhrase)
      ..writeByte(2)
      ..write(obj.bs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyVO _$CompanyVOFromJson(Map<String, dynamic> json) => CompanyVO(
      name: json['name'] as String?,
      catchPhrase: json['catchPhrase'] as String?,
      bs: json['bs'] as String?,
    );

Map<String, dynamic> _$CompanyVOToJson(CompanyVO instance) => <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };
