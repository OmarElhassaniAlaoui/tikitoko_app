
import 'package:dartz/dartz.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/domain/entities/following_entity.dart';
import 'package:tikto_app/src/domain/repositories/user_repository.dart';

class GetFollowingListUseCase {
  final BaseUserRepository basRepository;

  GetFollowingListUseCase(this.basRepository);

  Future<Either<Failure, List<UserFollowingListEntity>>> call() async {
    return await basRepository.getFollowingList();
  }
}