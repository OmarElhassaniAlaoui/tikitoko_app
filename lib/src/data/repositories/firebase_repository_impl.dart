import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/app/services/network_service_impl.dart';
import 'package:tikto_app/src/data/datasource/remote_data_sourece/firebase_remote_data_src.dart';
import 'package:tikto_app/src/domain/entities/user_firebase_entity.dart';
import 'package:tikto_app/src/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  FirebaseRepositoryImpl({
    required this.firebaseRemoteDataSrc,
    required this.networkServiceImpl,
  });

  final BaseFirebaseRemoteDataSrc firebaseRemoteDataSrc;
  final NetworkServiceImpl networkServiceImpl;

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    if (await networkServiceImpl.isConnected()) {
      try {
        final remoteUserData = await firebaseRemoteDataSrc.signInWithGoogle();
        return Right(remoteUserData!);
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
  Future<Either<Failure, User>> signInWithEmailAndPassword(String email, String password) async{
    if (await networkServiceImpl.isConnected()) {
      try {
        final remoteUserData = await firebaseRemoteDataSrc.signInWithEmailAndPassword(email, password);
        return Right(remoteUserData);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
  @override

  Future<void> getCreateCurrentUser(UserFirebaseEntity userFirebaseEntity) async {
    if (await networkServiceImpl.isConnected()) {
      try {
        await firebaseRemoteDataSrc.getCreateCurrentUser(userFirebaseEntity);
      } catch (e) {
        // Handle server error
      }
    } else {
      // Handle network connectivity error
    }
  }


  @override
  Future signInAnonymosly() async {
    if (await networkServiceImpl.isConnected()) {
      try {
        final remoteUserData = await firebaseRemoteDataSrc.signInAnonymosly();
        return Right(remoteUserData!);
      } catch (e) {
        return Left(ServerFailure());
      }
    }
  }
}
