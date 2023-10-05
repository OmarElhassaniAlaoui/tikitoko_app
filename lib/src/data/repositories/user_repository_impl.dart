import 'package:dartz/dartz.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/app/services/network_service_impl.dart';
import 'package:tikto_app/src/data/datasource/remote_data_sourece/user_remote_data_src.dart';
import 'package:tikto_app/src/domain/entities/following_entities/users_entity.dart';
import 'package:tikto_app/src/domain/entities/user_entity.dart';
import 'package:tikto_app/src/domain/entities/user_state_entity.dart';
import 'package:tikto_app/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements BaseUserRepository {

  UserRepositoryImpl({
    required this.userRemoteDataSource,
    required this.networkServiceImpl,
  });

  final BaseUserRemoteDataSource userRemoteDataSource;
  final NetworkServiceImpl networkServiceImpl;

  @override
  Future<Either<Failure, List<UserEntity>>> getUser() async {
    if (await networkServiceImpl.isConnected()) {
      try {
        final remoteUserData = await userRemoteDataSource.getUser();

        return Right(remoteUserData);
      } catch (e) {
        // Handle server error

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

        return Right(remoteUserData);
      } catch (e) {
        // Handle server error

        return Left(ServerFailure());
      }
    } else {
      // Handle network connectivity error
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, List<UsersEntity>>> getUsersList() async {
    if (await networkServiceImpl.isConnected()) {
      try {
        final usersListData = await userRemoteDataSource.getUsersList();
       
        return Right(usersListData);
      } catch (e) {
        // Handle server error
        
        return Left(ServerFailure());
      }
    } else {
      // Handle network connectivity error
      return Left(OfflineFailure());
    }
  }
 


 
  















}
