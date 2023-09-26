import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/search_user/controller/search_user_controller.dart';

class Validator {
  //todo : user name validatior if tha name not start with @
  static String validateUserName(
      String? value, SearchUserController controller) {
    Get.put<SearchUserController>(controller);
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (!value.startsWith('@')) {
      return 'Please enter valid user name';
    }
    if (value != "@${controller.userList[0].nickname}") {
      return 'Please enter valid user name';
    }

    return "";
  }
}
