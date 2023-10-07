import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/domain/entities/user_firebase_entity.dart';

abstract class FirebaseRepository {
  Future<Either<Failure,User>> signInWithEmailAndPassword(String email, String password);
  Future<Either<Failure ,UserCredential>> signInWithGoogle(); 
  Future signInAnonymosly();
  Future<void> getCreateCurrentUser(UserFirebaseEntity userFirebaseEntity) ; 

}
