import 'package:equatable/equatable.dart';

class UserStateEntity extends Equatable {
  final int followerCount;
  final int followingCount;
  final int heartCount;
  final int videoCount;
  final int diggCount;  


  const UserStateEntity({
    required this.followerCount,
    required this.followingCount,
    required this.heartCount,
    required this.videoCount,
    required this.diggCount,
  }); 

  @override
  List<Object?> get props => [
    followerCount,
    followingCount,
    heartCount,
    videoCount,
    diggCount,
  ];
}
