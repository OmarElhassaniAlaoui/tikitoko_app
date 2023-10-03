import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/search_user/controller/search_user_controller.dart';

class Validator {
  //todo : user name validatior if tha name not start with @
  static String validateUserName(
      String value, SearchUserController controller) {
    // Get.put<SearchUserController>(controller);
    // find the SearchUserController
    final controller = Get.find<SearchUserController>();
    if (value.isEmpty) {
      return "Please enter your username";
    } else if (!value.startsWith("@") && value != "@+${controller.userList[0].nickname}") {
      return "Please enter your username with @";
    } else {
      return "";
    }
  }
}
