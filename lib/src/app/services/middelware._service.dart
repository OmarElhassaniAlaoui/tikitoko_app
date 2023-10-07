import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/app/routes/app_pages.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';


class MiddelWare extends GetMiddleware {
  @override
  int? get priority => 1;
  LocalStorageService service = Get.find<LocalStorageService>();
  @override
  RouteSettings? redirect(String? route) {
    
    if (service.sharedPreferences.getString("step") == '3') {
      return const RouteSettings(name: AppPages.home);
    }
    if (service.sharedPreferences.getString("step") == '2') {
      return const RouteSettings(name: AppPages.loginPage);
    }

    if (service.sharedPreferences.getString("step") == '1') {
      return const RouteSettings(name: AppPages.searchUser);
    }

    return null;
  }
}