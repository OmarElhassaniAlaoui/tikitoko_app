abstract class BaseFirebaseRemoteDataSrc {
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<void> resetPassword(String email);
  Future<void> googleAuth();
}

class FirebaseRemoteDataSrc implements BaseFirebaseRemoteDataSrc {
  @override
  Future<void> createUserWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  // @override
  // Future<void> googleAuth() async {
  //   try {
  //     final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     throw e;
  //   }
  // }

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
  
  @override
  Future<void> googleAuth() {
    throw UnimplementedError();
  }

  
}
