import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tikto_app/src/data/models/user_auth_model.dart';

abstract class BaseFirebaseRemoteDataSrc {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future<UserAuthModel?> signInWithGoogle();
}

class FirebaseRemoteDataSrc implements BaseFirebaseRemoteDataSrc {

  FirebaseRemoteDataSrc({required this.firebaseAuth, required this.firestore});
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  @override
  Future<void> createUserWithEmailAndPassword(String email, String password) {
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

 // sign in with google method 
  @override
  Future<UserAuthModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();
      if (googleSignIn == null) return null;
      final GoogleSignInAuthentication googleAuth =
          await googleSignIn.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      return UserAuthModel(
        email: userCredential.user!.email!,
        password: '',
        uid: userCredential.user!.uid,
      );
    } catch (e) {
      // Handle errors appropriately
      rethrow;
    }
  }
}
