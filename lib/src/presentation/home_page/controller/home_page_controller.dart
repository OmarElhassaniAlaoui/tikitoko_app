import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/home_page/model/account_state_model.dart';
import 'package:tikto_app/src/presentation/home_page/model/feeling_model.dart';

class HomeController extends GetxController {
  RxBool isFeelingPressed = false.obs;

  RxList<FeelingModel> feelings = <FeelingModel>[].obs;
   List <AccountStatModel> accountStatList = [];

  void getFeelings() {
    feelings = FeelingModel.getFeeling();
  }

  void getAccountStat() {
    accountStatList = AccountStatModel.getAccountStatus(); 
  }

  @override
  void onInit() {
    getFeelings();
    getAccountStat();
    super.onInit();
  }

  void changeFeeling([int? index]) {
    for (int i = 0; i < feelings.length; i++) {
      if (i == index) {
        feelings[i].isFeelingPressed = true.obs;
      } else {
        feelings[i].isFeelingPressed = false.obs;
      }
    }
    update();
  }
  // void changeFeeling([int? index]) {
  //   switch (index) {
  //     case 0:
  //       feelings[0].isFeelingPressed = true.obs;
  //       feelings[1].isFeelingPressed = false.obs;
  //       feelings[2].isFeelingPressed = false.obs;
  //       feelings[3].isFeelingPressed = false.obs;
  //     case 1:
  //       feelings[0].isFeelingPressed = false.obs;
  //       feelings[1].isFeelingPressed = true.obs;
  //       feelings[2].isFeelingPressed = false.obs;
  //       feelings[3].isFeelingPressed = false.obs;
  //     case 2:
  //       feelings[0].isFeelingPressed = false.obs;
  //       feelings[1].isFeelingPressed = false.obs;
  //       feelings[2].isFeelingPressed = true.obs;
  //       feelings[3].isFeelingPressed = false.obs;
  //     case 3:
  //       feelings[0].isFeelingPressed = false.obs;
  //       feelings[1].isFeelingPressed = false.obs;
  //       feelings[2].isFeelingPressed = false.obs;
  //       feelings[3].isFeelingPressed = true.obs;
  //       break;
  //   }
  //   update();
  // }

  // void feelingPressed() {
  //  isFeelingPressed.value = !isFeelingPressed.value;
  // update();
  // }
}
