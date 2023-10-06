import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/domain/repositories/firebase_repository.dart';

class SignInWithEmailAndPasswdUsC{
  final FirebaseRepository firebaseRepository; 
  SignInWithEmailAndPasswdUsC( {required this.firebaseRepository});

  Future<Either<Failure,User>> call(String email, String password) async {
    return await firebaseRepository.signInWithEmailAndPassword(email, password);
  } 

}