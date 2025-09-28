// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OffersEntityAdapter extends TypeAdapter<OffersEntity> {
  @override
  final int typeId = 0;

  @override
  OffersEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OffersEntity(
      id: fields[0] as String,
      name: fields[1] as String,
      offerName: fields[2] as String,
      description: fields[3] as String,
      image: fields[4] as String,
      price: fields[5] as double,
      category: fields[6] as String,
      priceAfterDiscount: fields[7] as double,
    );
  }

  @override
  void write(BinaryWriter writer, OffersEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.offerName)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.priceAfterDiscount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OffersEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
