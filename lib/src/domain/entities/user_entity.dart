import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String nickname;
  final String avatarLarger;
  final String avatarThumb; 


  const UserEntity({
    required this.nickname,
    required this.avatarLarger,
    required this.avatarThumb,
  });

  @override
  List<Object?> get props => [
    nickname,
    avatarLarger,
    avatarThumb,
  ];
  
}
