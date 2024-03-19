import 'package:hive/hive.dart';
part 'user_detail_response.g.dart';
@HiveType(typeId: 0)
class UserDetailResponse {
  UserDetailResponse({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    this.creationAt,
    this.updatedAt,
  });

  factory UserDetailResponse.fromJson(Map<String, dynamic> json) =>
      UserDetailResponse(
        id: json['id'] == null ? null : json['id'] as num,
        email: json['email'] == null ? null : json['email'] as String,
        password: json['password'] == null ? null : json['password'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        role: json['role'] == null ? null : json['role'] as String,
        avatar: json['avatar'] == null ? null : json['avatar'] as String,
        creationAt:
            json['creationAt'] == null ? null : json['creationAt'] as String,
        updatedAt:
            json['updatedAt'] == null ? null : json['updatedAt'] as String,
      );
  @HiveField(1)
  num? id;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? password;
  @HiveField(4)
  String? name;
  @HiveField(5)
  String? role;
  @HiveField(6)
  String? avatar;
  @HiveField(7)
  String? creationAt;
  @HiveField(8)
  String? updatedAt;
}
