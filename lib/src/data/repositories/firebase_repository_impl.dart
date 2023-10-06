import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/app/services/network_service_impl.dart';
import 'package:tikto_app/src/data/datasource/remote_data_sourece/firebase_remote_data_src.dart';
import 'package:tikto_app/src/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {

  FirebaseRepositoryImpl({
    required this.firebaseRemoteDataSrc,
    required this.networkServiceImpl,
  }); 

  final BaseFirebaseRemoteDataSrc firebaseRemoteDataSrc;
  final NetworkServiceImpl networkServiceImpl;

  @override
  Future<void> createUserWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure ,UserCredential>> signInWithGoogle() async{
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
  Future<void> resetPassword(String email) {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
  
}
