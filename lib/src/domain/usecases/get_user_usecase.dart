import 'package:dartz/dartz.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/domain/entities/user_entity.dart';
import 'package:tikto_app/src/domain/repositories/user_repository.dart';

class GetUserUseCase {
  final BaseUserRepository basRepository;

  GetUserUseCase(this.basRepository);

  Future<Either<Failure, List<UserEntity>>> call() async {
    return await basRepository.getUser();
  }
}
