import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/data/models/user_auth_model.dart';
import 'package:tikto_app/src/domain/entities/user_firebase_entity.dart';

abstract class BaseFirebaseRemoteDataSrc {
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> getCreateCurrentUser(UserFirebaseEntity userFirebaseEntity);
  Future signInWithGoogle();
  Future signInAnonymosly();
}


class FirebaseRemoteDataSrc implements BaseFirebaseRemoteDataSrc {
  FirebaseRemoteDataSrc();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final LocalStorageService service = LocalStorageService();

  @override
  Future<void> getCreateCurrentUser(
      UserFirebaseEntity userFirebaseEntity) async {
    final userCollection = firestore.collection("users");
    final userUid = firebaseAuth.currentUser!.uid;
    await userCollection.doc(userUid).get().then((userDoc) {
      final newUser = UserFirebaseModel(
        uid: userFirebaseEntity.uid,
        email: userFirebaseEntity.email,
        nickName: userFirebaseEntity.nickName,
        avatarThumb: userFirebaseEntity.avatarThumb,
        followerCount: userFirebaseEntity.followerCount,
        followingCount: userFirebaseEntity.followingCount,
        videoCount: userFirebaseEntity.videoCount,
        heartCount: userFirebaseEntity.heartCount,
        password: userFirebaseEntity.password,
        feeling: userFirebaseEntity.feeling,
      ).toDocument();
      if (!userDoc.exists) {
        userCollection.doc(userUid).set(newUser);
        return; 
      } else {
        userCollection.doc(userUid).update(newUser);
      }
    }).catchError((e) {
      // ignore: avoid_print
      print(e);
    });
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
