import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/domain/usecases/firebase_usecases/google_auth_usecase.dart';

class AuthController extends GetxController {
  AuthController({
    required this.googleSignInUseCase,
  });
  final GoogleSignInUseCase googleSignInUseCase;

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
