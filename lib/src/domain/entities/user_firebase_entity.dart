import 'package:equatable/equatable.dart';

class UserFirebaseEntity extends Equatable {
  final String uid;
  final String email;
  final String password;
  final String nickName;
  final String followerCount;
  final String followingCount;
  final String videoCount;
  final String heartCount;
  final String avatarThumb;
  final String feeling; 

  const UserFirebaseEntity({
    required this.uid,
    required this.email,
    required this.password,
    required this.nickName,
    required this.followerCount,
    required this.followingCount,
    required this.videoCount,
    required this.heartCount,
    required this.avatarThumb,
    required this.feeling,
  });

  @override
  List<Object?> get props => [
        uid,
        email,
        password,
        nickName,
        followerCount,
        followingCount,
        videoCount,
        heartCount,
        avatarThumb, 
        feeling,
      ];
}
