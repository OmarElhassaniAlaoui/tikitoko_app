import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseFirebaseRemoteDataSrc {
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future signInWithGoogle();
  Future signInAnonymosly();
}

class FirebaseRemoteDataSrc implements BaseFirebaseRemoteDataSrc {
  FirebaseRemoteDataSrc();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      // ignore: unused_local_variable
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Future<void> resetPassword(String email) {
    throw UnimplementedError();
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'week-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
      }
      rethrow;
    }
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
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

  @override
  Future<void> signInAnonymosly() async {
    try {
      await firebaseAuth.signInAnonymously();
      // ignore: avoid_print
      print("Signed in Anonymously");
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          // ignore: avoid_print
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          // ignore: avoid_print
          print("Unknown error.");
      }
    }
  }
}
