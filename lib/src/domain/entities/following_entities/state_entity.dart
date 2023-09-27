import 'package:equatable/equatable.dart';

class StatsEntity extends Equatable {
  final int diggCount;
  final int followerCount;
  final int followingCount;
  final int heart;
  final int heartCount;
  final int videoCount;

  const StatsEntity({
    required this.diggCount,
    required this.followerCount,
    required this.followingCount,
    required this.heart,
    required this.heartCount,
    required this.videoCount,
  });

  @override
  List<Object?> get props => [
        diggCount,
        followerCount,
        followingCount,
        heart,
        heartCount,
        videoCount,
      ];
}
