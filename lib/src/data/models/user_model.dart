import 'package:tikto_app/src/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.nickname,
      required super.avatarLarger,
      required super.avatarThumb});
      
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      nickname: json['nickname'],
      avatarLarger: json['avatar_larger'],
      avatarThumb: json['avatar_thumb'],
    );
  }
}
