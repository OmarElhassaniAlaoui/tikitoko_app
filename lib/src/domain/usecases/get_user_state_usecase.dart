import 'package:dartz/dartz.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/domain/entities/user_state_entity.dart';
import 'package:tikto_app/src/domain/repositories/user_repository.dart';

class GetUserStateUsecase {
  final BaseUserRepository baseUserRepository;

  GetUserStateUsecase(this.baseUserRepository);

  Future<Either<Failure, List<UserStateEntity>>> call() async {
    return await baseUserRepository.getUserState();
  }
}
