import 'package:dartz/dartz.dart';
import 'package:tikto_app/src/app/core/errors/exceptions.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/app/services/network_service_impl.dart';
import 'package:tikto_app/src/data/datasource/remote_data_sourece/user_remote_data_src.dart';
import 'package:tikto_app/src/domain/entities/user_entity.dart';
import 'package:tikto_app/src/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements BaseUserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final NetworkServiceImpl networkServiceImpl;
  UserRepositoryImpl(
      {required this.userRemoteDataSource, required this.networkServiceImpl});

  @override
  Future<Either<Failure, List<UserEntity>>> getUser() async {
    if (await networkServiceImpl.isConnected()) {
      try {
        final remoteUserData = await userRemoteDataSource.getUser();
        return Right(remoteUserData);
      } on ServerException { 
        return Left(ServerFailure());
      }
    }else{
      return Left(ServerFailure());
    }
  }
}
