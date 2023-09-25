import 'package:dartz/dartz.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/domain/entities/user_entity.dart';

abstract class BaseUserRepository {
  Future<Either<Failure , List<UserEntity>>> getUser();  

}
