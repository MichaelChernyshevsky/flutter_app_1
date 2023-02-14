// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DictionaryAdapter extends TypeAdapter<Dictionary> {
  @override
  final int typeId = 0;

  @override
  Dictionary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dictionary(
      name: fields[0] as String?,
      dict: (fields[1] as List?)?.cast<Word>(),
    );
  }

  @override
  void write(BinaryWriter writer, Dictionary obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.dict);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DictionaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
