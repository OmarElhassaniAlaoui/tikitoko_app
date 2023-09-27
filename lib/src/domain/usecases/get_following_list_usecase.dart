import 'package:dartz/dartz.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/domain/entities/following_entities/users_entity.dart';
import 'package:tikto_app/src/domain/repositories/user_repository.dart';

class GetUsersListUseCase {
  final BaseUserRepository userRepository;

  GetUsersListUseCase(this.userRepository);

    Future<Either<Failure, List<UsersEntity>>> call() async {
    return await userRepository.getUsersList();
  }
}
