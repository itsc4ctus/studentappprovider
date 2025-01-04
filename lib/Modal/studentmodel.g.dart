// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModalAdapter extends TypeAdapter<StudentModal> {
  @override
  final int typeId = 0;

  @override
  StudentModal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModal(
      name: fields[0] as String,
      age: fields[1] as int,
      department: fields[3] as String,
      image: fields[4] as String,
      cgpa: fields[5] as double,
      rollNo: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModal obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age)
      ..writeByte(2)
      ..write(obj.rollNo)
      ..writeByte(3)
      ..write(obj.department)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.cgpa);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModalAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
