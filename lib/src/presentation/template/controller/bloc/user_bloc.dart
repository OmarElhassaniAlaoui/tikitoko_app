import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/domain/entities/user_entity.dart';
import 'package:tikto_app/src/domain/usecases/get_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase getUserUseCase;
  UserBloc(this.getUserUseCase) : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is GetUserEvent) {
        emit(UserLoading());
        final result = await getUserUseCase.call();
        emit(_mapFailureOrUserToState(result));
      } else if (event is RefreshUserEvent) {
        final result = await getUserUseCase.call();
        emit(_mapFailureOrUserToState(result));
      }
    });
  }
  UserState _mapFailureOrUserToState(Either<Failure, List<UserEntity>> result) {
    return result.fold(
      (failure) => UserError(message: _mapFailureToMessage(failure)),
      (user) => UserLoaded(user: user),
    );
  }
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Server Failure';
    case OfflineFailure:
      return 'Cache Failure';
    default:
      return 'Unexpected Error';
  }
}
