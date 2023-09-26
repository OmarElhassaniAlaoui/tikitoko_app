part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends UserEvent {}

class GetFollowingEvent extends UserEvent {
  const GetFollowingEvent();
}

class GetFollowersEvent extends UserEvent {
  const GetFollowersEvent();
}

class SearchUserEvent extends UserEvent {
  final String username;
  const SearchUserEvent({required this.username});
}

class RefreshUserEvent extends UserEvent {}
