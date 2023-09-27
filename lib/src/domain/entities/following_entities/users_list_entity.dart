import 'package:equatable/equatable.dart';

import 'users_entity.dart';

class UserListEntity extends Equatable {
  final List<UsersEntity> userList;

  UserListEntity({
    required this.userList,
  });

  @override
  List<Object?> get props => [
        userList,
      ];
}
