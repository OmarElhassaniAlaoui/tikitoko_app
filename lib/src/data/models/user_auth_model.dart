import 'package:tikto_app/src/domain/entities/user_firebase_entity.dart';

class UserFirebaseModel extends UserFirebaseEntity {
  const UserFirebaseModel({
    required String email,
    required String password,
    required String uid,
    required String nickName,
    required String followerCount,
    required String followingCount,
    required String videoCount,
    required String heartCount,
    required String avatarThumb,
    required String feeling,
  }) : super(
          uid: uid,
          email: email,
          password: password,
          nickName: nickName,
          followerCount: followerCount,
          followingCount: followingCount,
          videoCount: videoCount,
          heartCount: heartCount,
          avatarThumb: avatarThumb,
          feeling: feeling,
        );

  factory UserFirebaseModel.fromJson(Map<String, dynamic> json) {
    return UserFirebaseModel(
      email: json['email'],
      password: json['password'],
      uid: json['uid'],
      nickName: json['nickName'],
      followerCount: json['followerCount'],
      followingCount: json['followingCount'],
      videoCount: json['videoCount'],
      heartCount: json['heartCount'],
      avatarThumb: json['avatarThumb'],
      feeling: json['feeling'],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'email': email,
      'password': password,
      'uid': uid,
      'nickName': nickName,
      'followerCount': followerCount,
      'followingCount': followingCount,
      'videoCount': videoCount,
      'heartCount': heartCount,
      'avatarThumb': avatarThumb,
      'feeling': feeling,
    };
  }
}
