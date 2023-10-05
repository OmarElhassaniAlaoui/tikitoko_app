import 'package:tikto_app/src/app/services/network_service_impl.dart';
import 'package:tikto_app/src/data/datasource/remote_data_sourece/firebase_remote_data_src.dart';
import 'package:tikto_app/src/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImp implements FirebaseRepository {

  FirebaseRepositoryImp({
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
  Future<void> googleAuth() {
    throw UnimplementedError();
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
