import 'package:dartz/dartz.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/app/services/network_service_impl.dart';
import 'package:tikto_app/src/data/datasource/remote_data_sourece/user_remote_data_src.dart';
import 'package:tikto_app/src/domain/entities/following_entity.dart';
import 'package:tikto_app/src/domain/entities/user_entity.dart';
import 'package:tikto_app/src/domain/entities/user_state_entity.dart';
import 'package:tikto_app/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements BaseUserRepository {
  final BaseUserRemoteDataSource userRemoteDataSource;
  final NetworkServiceImpl networkServiceImpl;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
    required this.networkServiceImpl,
  });

  @override
  Future<Either<Failure, List<UserEntity>>> getUser() async {
    if (await networkServiceImpl.isConnected()) {
      try {
        final remoteUserData = await userRemoteDataSource.getUser();
        print(remoteUserData);
        return Right(remoteUserData);
      } catch (e) {
        // Handle server error
        print(e);
        return Left(ServerFailure());
      }
    } else {
      // Handle network connectivity error
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<UserStateEntity>>> getUserState() async {
    if (await networkServiceImpl.isConnected()) {
      try {
        final remoteUserData = await userRemoteDataSource.getUserState();
        print(remoteUserData);
        return Right(remoteUserData);
      } catch (e) {
        // Handle server error
        print(e);
        return Left(ServerFailure());
      }
    } else {
      // Handle network connectivity error
      return Left(OfflineFailure());
    }
  }


  @override
  Future<Either<Failure, List<UserFollowingListEntity>>> getFollowingList() async {
    if (await networkServiceImpl.isConnected()) {
      try {
        final remoteUserData = await userRemoteDataSource.getFollowingList();
        print(remoteUserData);
        return Right(remoteUserData);
      } catch (e) {
        // Handle server error
        print(e);
        return Left(ServerFailure());
      }
    } else {
      // Handle network connectivity error
      return Left(OfflineFailure());
    }
  }
  
 
  















}
