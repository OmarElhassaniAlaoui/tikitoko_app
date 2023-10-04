import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties = const <dynamic>[]]);
}

class OfflineFailure extends Failure {

  static const String iconNoInternet = "assets/icons/wifi.svg";
  static const String message = "no internet";

  @override
  List<Object?> get props => [message, iconNoInternet];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}
