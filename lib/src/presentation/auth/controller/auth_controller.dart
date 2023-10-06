import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/domain/usecases/firebase_usecases/google_auth_usecase.dart';
import 'package:tikto_app/src/domain/usecases/firebase_usecases/sign_in_anonyimos.dart';
import 'package:tikto_app/src/domain/usecases/firebase_usecases/sign_in_email_passwd_usecase.dart';

class AuthController extends GetxController {
  AuthController({
    required this.googleSignInUseCase,
    required this.signInAnonymUseCas,
    required this.signInWithEmailAndPasswdUsC,
  });
  final GoogleSignInUseCase googleSignInUseCase;
  final SignInAnonymUseCas signInAnonymUseCas ;
  final SignInWithEmailAndPasswdUsC signInWithEmailAndPasswdUsC;

  Future<void> googleSignIn() async {
    final result = await googleSignInUseCase.call();
    result.fold(
      (failure) => Get.defaultDialog(
        title: "Error",
        middleText: "No internet connection",
        textConfirm: "Ok",
        onConfirm: () => Get.back(),
      ), // Handle error
      // ignore: avoid_print
      (users) => print(users),
    );
  }



  Future<void> signInWithEmailAndPasswd(String email, String passwd) async {
    final result = await signInWithEmailAndPasswdUsC.call(email, passwd);

    result.fold(
      (failure) => Get.defaultDialog(
        title: "Error",
        middleText: "No internet connection",
        textConfirm: "Ok",
        onConfirm: () => Get.back(),
      ), // Handle error
      // ignore: avoid_print
      (users) => print(users),
    );
  } 

  Future<void> signInAnoymosly()async{
    final result = await FirebaseAuth.instance.signInAnonymously();
    if(result.user != null){
      // ignore: avoid_print
      print("User is signed in");
    }else{
      // ignore: avoid_print
      print("User is not signed in");
    }
  }
  
  userLoginStat() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        // ignore: avoid_print
        print('User is currently signed out!');
      } else {
        // ignore: avoid_print
        print('User is signed in!');
      }
    });
  }

  @override
  void onInit() {
    userLoginStat();
    super.onInit();
  }
}
