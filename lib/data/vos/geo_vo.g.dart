// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GeoVOAdapter extends TypeAdapter<GeoVO> {
  @override
  final int typeId = 3;

  @override
  GeoVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GeoVO(
      lat: fields[0] as String?,
      lng: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GeoVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoVO _$GeoVOFromJson(Map<String, dynamic> json) => GeoVO(
      lat: json['lat'] as String?,
      lng: json['lng'] as String?,
    );

Map<String, dynamic> _$GeoVOToJson(GeoVO instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
