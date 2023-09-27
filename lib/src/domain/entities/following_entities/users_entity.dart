import 'package:equatable/equatable.dart';
import 'package:tikto_app/src/domain/entities/following_entities/state_entity.dart';
import 'package:tikto_app/src/domain/entities/following_entities/user_state_entity.dart';

class UsersEntity extends Equatable {
  final StatsEntity stats;
  final UserStatsEntity user;

  const UsersEntity({
    required this.stats,
    required this.user,
  });

  @override
  List<Object?> get props => [stats, user];
}
