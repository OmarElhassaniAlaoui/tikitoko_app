import 'package:tikto_app/src/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String nickname,
    required String avatarLarger,
    required String avatarThumb,
  }) : super(
          nickname: nickname,
          avatarLarger: avatarLarger,
          avatarThumb: avatarThumb,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      nickname: json['MobileUserModule']['users']['x2b1']['nickname'],
      avatarLarger: json['MobileUserModule']['users']['x2b1']['avatarLarger'],
      avatarThumb: json['MobileUserModule']['users']['x2b1']['avatarThumb'],
    );
  }
}
