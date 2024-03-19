// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailResponseAdapter extends TypeAdapter<UserDetailResponse> {
  @override
  final int typeId = 0;

  @override
  UserDetailResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetailResponse(
      id: fields[1] as num?,
      email: fields[2] as String?,
      password: fields[3] as String?,
      name: fields[4] as String?,
      role: fields[5] as String?,
      avatar: fields[6] as String?,
      creationAt: fields[7] as String?,
      updatedAt: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDetailResponse obj) {
    writer
      ..writeByte(8)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.role)
      ..writeByte(6)
      ..write(obj.avatar)
      ..writeByte(7)
      ..write(obj.creationAt)
      ..writeByte(8)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
