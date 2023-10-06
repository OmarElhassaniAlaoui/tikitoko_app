import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';

abstract class FirebaseRepository {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future<Either<Failure ,UserCredential>> signInWithGoogle(); 
}
