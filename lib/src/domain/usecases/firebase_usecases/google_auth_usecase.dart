import 'package:tikto_app/src/domain/repositories/firebase_repository.dart';

class GoogleSignInUseCase {
  final FirebaseRepository firebaseRepository;

  GoogleSignInUseCase({required this.firebaseRepository});

  Future<void> call() async {
    return await firebaseRepository.googleAuth();
  }
}
