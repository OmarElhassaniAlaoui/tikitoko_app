import 'package:tikto_app/src/domain/entities/user_state_entity.dart';

class UserStateModel extends UserStateEntity {
  const UserStateModel({
    required int followerCount,
    required int followingCount,
    required int heartCount,
    required int videoCount,
    required int diggCount,
  }) : super(
          followerCount: followerCount,
          followingCount: followingCount,
          heartCount: heartCount,
          videoCount: videoCount,
          diggCount: diggCount,
        );

  factory UserStateModel.fromJson(Map<String, dynamic> json) {
    return UserStateModel( 
      followerCount: json['MobileUserModule']['stats']['x2b1']['followerCount'],
      followingCount: json['MobileUserModule']['stats']['x2b1']['followingCount'],
      heartCount: json['MobileUserModule']['stats']['x2b1']['heartCount'],
      videoCount: json['MobileUserModule']['stats']['x2b1']['videoCount'],
      diggCount: json['MobileUserModule']['stats']['x2b1']['diggCount'],
    ); 
  }
}
