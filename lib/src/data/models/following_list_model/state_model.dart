import 'package:tikto_app/src/domain/entities/following_entities/state_entity.dart';

class StatsModel extends StatsEntity{
  const StatsModel({
    required int diggCount,
    required int followerCount,
    required int followingCount,
    required int heart,
    required int heartCount,
    required int videoCount,
  }) : super(
    diggCount: diggCount,
    followerCount: followerCount,
    followingCount: followingCount,
    heart: heart,
    heartCount: heartCount,
    videoCount: videoCount,
  );

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(
      diggCount: json['diggCount'],
      followerCount: json['followerCount'],
      followingCount: json['followingCount'],
      heart: json['heart'],
      heartCount: json['heartCount'],
      videoCount: json['videoCount'],
    );
  }
  

}