import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseFirebaseRemoteDataSrc {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future signInWithGoogle();
}

class FirebaseRemoteDataSrc implements BaseFirebaseRemoteDataSrc {
  FirebaseRemoteDataSrc();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
  // Future<UserAuthModel?> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleSignIn = await GoogleSignIn().signIn();
  //     if (googleSignIn == null) return null;
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleSignIn.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     final UserCredential userCredential =
  //         await firebaseAuth.signInWithCredential(credential);
  //     return UserAuthModel(
  //       email: userCredential.user!.email!,
  //       password: '',
  //       uid: userCredential.user!.uid,
  //     );
  //   } catch (e) {
  //     // Handle errors appropriately
  //     rethrow;
  //   }
  // }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
