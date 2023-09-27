import 'package:dartz/dartz.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/domain/entities/following_entity.dart';
import 'package:tikto_app/src/domain/entities/user_entity.dart';
import 'package:tikto_app/src/domain/entities/user_state_entity.dart';

abstract class BaseUserRepository {
  Future<Either<Failure , List<UserEntity>>> getUser(); 

  Future<Either<Failure ,List<UserStateEntity> >> getUserState(); 

  Future<Either<Failure ,List<UserFollowingListEntity> >> getFollowingList();

}
