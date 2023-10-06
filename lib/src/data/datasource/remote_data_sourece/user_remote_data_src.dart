import 'dart:convert';

import 'package:tikto_app/src/app/core/services/api_service.dart';
import 'package:tikto_app/src/app/resources/constant_manager.dart';
import 'package:tikto_app/src/data/models/following_list_model/users_model.dart';
import 'package:tikto_app/src/data/models/user_model.dart';
import 'package:tikto_app/src/data/models/user_state_model.dart';

abstract class BaseUserRemoteDataSource {
  Future<List<UserModel>> getUser();
  Future<List<UserStateModel>> getUserState();  
  Future<List<UsersModel>> getUsersList();
}

// user remote data source implementation 
class UserRemoteDataSource implements BaseUserRemoteDataSource {
  final ApiService api;

  UserRemoteDataSource({required this.api});
  @override
  Future<List<UserModel>> getUser() async {
    final response = await api.get(ConstantManager.userInfoUrl);
    if (response.status == 200) {
      final  data = UserModel.fromJson(jsonDecode(response.body));
      return [data]; 
    }else{
      throw Exception('Error fetching user');
    }
  }

  @override
  Future<List<UserStateModel>> getUserState() async {
    final response = await api.get(ConstantManager.userInfoUrl);
    if (response.status == 200) {
      final  data = UserStateModel.fromJson(jsonDecode(response.body));
      return [data]; 
    }else{
      throw Exception('Error fetching user');
    }
  }

  @override
  Future<List<UsersModel>> getUsersList() async {
    final response = await api.get(ConstantManager.followingListUrl);
    if (response.status == 200) {
      final List<dynamic> usersJsonList = json.decode(response.body)['userList'];
      return usersJsonList.map((json) => UsersModel.fromJson(json)).toList();
    } else {
      throw Exception();
    }
  }

}
