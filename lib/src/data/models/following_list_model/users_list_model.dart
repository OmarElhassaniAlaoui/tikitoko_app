import 'package:tikto_app/src/data/models/following_list_model/users_model.dart';
import 'package:tikto_app/src/domain/entities/following_entities/users_list_entity.dart';

class UserListModel extends UserListEntity {
  UserListModel({
    required List<UsersModel> userList,
  }) : super(
          userList: userList,
        );

  factory UserListModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> userListJson = json['userList'];
    final List<UsersModel> userList =
        userListJson.map((userJson) => UsersModel.fromJson(userJson)).toList();

    return UserListModel(
      userList: userList,
    );
  }
}
