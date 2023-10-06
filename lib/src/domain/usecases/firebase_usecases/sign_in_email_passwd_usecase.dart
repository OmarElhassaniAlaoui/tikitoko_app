import 'package:tikto_app/src/domain/repositories/firebase_repository.dart';

class SignInWithEmailAndPasswdUsC{
  final FirebaseRepository firebaseRepository; 
  SignInWithEmailAndPasswdUsC( {required this.firebaseRepository});

  Future call(String email, String password) async {
    return await firebaseRepository.signInWithEmailAndPassword(email, password);
  } 

}