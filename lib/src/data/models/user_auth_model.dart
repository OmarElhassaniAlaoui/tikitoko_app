import 'package:tikto_app/src/domain/entities/user_auth_entity.dart';

class UserAuthModel extends UserAuthEntity {
  const UserAuthModel({
    required String email,
    required String password,
    required String uid,
  }) : super(uid: uid, email: email, password: password);

  factory UserAuthModel.fromJson(Map<String, dynamic> json) {
    return UserAuthModel(
      email: json['email'],
      password: json['password'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'uid': uid,
    };
  } 
  
}
