// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prodacts_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductsEntityAdapter extends TypeAdapter<ProductsEntity> {
  @override
  final int typeId = 1;

  @override
  ProductsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductsEntity(
      id: fields[0] as String,
      categoryId: fields[1] as String,
      name: fields[2] as String,
      description: fields[3] as String,
      image: fields[4] as String,
      price: fields[5] as double,
      category: fields[6] as String,
      priceAfterDiscount: fields[7] as double,
    );
  }

  @override
  void write(BinaryWriter writer, ProductsEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.categoryId)
      ..writeByte(2)
      ..write(obj.name)
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
      other is ProductsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
