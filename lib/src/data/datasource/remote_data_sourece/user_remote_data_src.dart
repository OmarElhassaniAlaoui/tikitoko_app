import 'dart:convert';

import 'package:tikto_app/src/app/core/services/api_service.dart';
import 'package:tikto_app/src/app/resources/constant_manager.dart';
import 'package:tikto_app/src/data/models/user_model.dart';

abstract class BaseUserRemoteDataSource {
  Future<List<UserModel>> getUser();
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
}
