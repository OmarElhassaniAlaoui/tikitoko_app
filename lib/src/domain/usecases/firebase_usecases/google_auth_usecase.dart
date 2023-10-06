import 'package:dartz/dartz.dart';
import 'package:tikto_app/src/app/core/errors/failures.dart';
import 'package:tikto_app/src/domain/entities/user_auth_entity.dart';
import 'package:tikto_app/src/domain/repositories/firebase_repository.dart';

class GoogleSignInUseCase {
  final FirebaseRepository firebaseRepository;

  GoogleSignInUseCase({required this.firebaseRepository});

  Future<Either<Failure ,UserAuthEntity>> call() async {
    return await firebaseRepository.signInWithGoogle();
  }
}
