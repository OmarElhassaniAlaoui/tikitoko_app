import 'dart:convert';

import 'package:tikto_app/src/app/core/services/api_service.dart';
import 'package:tikto_app/src/app/resources/constant_manager.dart';
import 'package:tikto_app/src/data/models/user_following_list_model.dart';
import 'package:tikto_app/src/data/models/user_model.dart';
import 'package:tikto_app/src/data/models/user_state_model.dart';

abstract class BaseUserRemoteDataSource {
  Future<List<UserModel>> getUser();
  Future<List<UserStateModel>> getUserState();  
  Future<List<UserFollowingListModel>> getFollowingList();
}

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
  Future<List<UserFollowingListModel>> getFollowingList() async {
    final response = await api.get(ConstantManager.followingListUrl);
    if (response.status == 200) {
    final List<dynamic> jsonDataList = jsonDecode(response.body);
      final  data =jsonDataList.map(((json)=>UserFollowingListModel.fromJson(json))).toList() ;
        // UserFollowingListModel.fromJson(jsonDecode(response.body));
      return data; 
    }else{
      throw Exception('Error fetching user');
    }
  }

}
