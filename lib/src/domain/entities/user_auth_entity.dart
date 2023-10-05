import 'package:equatable/equatable.dart';

class UserAuthEntity extends Equatable {
  final String uid;
  final String email;
  final String password;

  const UserAuthEntity({
    required this.uid,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [uid, email, password];
}
