import 'package:tikto_app/src/data/models/following_list_model/state_model.dart';
import 'package:tikto_app/src/data/models/following_list_model/users_state_model.dart';
import 'package:tikto_app/src/domain/entities/following_entities/users_entity.dart';

class UsersModel extends UsersEntity {
  const UsersModel({
    required StatsModel stats,
    required UserStatsModel user,
  }) : super(
          stats: stats,
          user: user,
        );

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> statsJson = json['stats'];
    final Map<String, dynamic> userJson = json['user'];

    return UsersModel(
      stats: StatsModel.fromJson(statsJson),
      user: UserStatsModel.fromJson(userJson),
    );
  }
}
