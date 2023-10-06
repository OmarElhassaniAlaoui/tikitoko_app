import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/domain/repositories/firebase_repository.dart';

class SignInAnonymUseCas {
  final FirebaseRepository firebaseRepository;

  SignInAnonymUseCas(this.firebaseRepository);

  Future<Either<Failure, User>> call() async {
    return await firebaseRepository.signInAnonymosly();
  }
}

