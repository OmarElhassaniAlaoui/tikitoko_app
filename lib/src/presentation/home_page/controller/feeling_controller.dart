import 'package:get/get.dart';

class FeelinController extends GetxController {
  RxBool isFeelingPressed = false.obs;

  void feelingPressed() {
    isFeelingPressed.value = !isFeelingPressed.value;
  }

}
