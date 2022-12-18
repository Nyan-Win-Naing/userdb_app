// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressVOAdapter extends TypeAdapter<AddressVO> {
  @override
  final int typeId = 1;

  @override
  AddressVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddressVO(
      street: fields[0] as String?,
      suite: fields[1] as String?,
      city: fields[2] as String?,
      zipCode: fields[3] as String?,
      geo: fields[4] as GeoVO?,
    );
  }

  @override
  void write(BinaryWriter writer, AddressVO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.suite)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.zipCode)
      ..writeByte(4)
      ..write(obj.geo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressVO _$AddressVOFromJson(Map<String, dynamic> json) => AddressVO(
      street: json['street'] as String?,
      suite: json['suite'] as String?,
      city: json['city'] as String?,
      zipCode: json['zipcode'] as String?,
      geo: json['geo'] == null
          ? null
          : GeoVO.fromJson(json['geo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressVOToJson(AddressVO instance) => <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipCode,
      'geo': instance.geo,
    };
