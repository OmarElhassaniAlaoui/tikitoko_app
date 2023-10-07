import 'package:get/get.dart';

import 'package:tikto_app/src/app/services/network_service_impl.dart';
import 'package:tikto_app/src/app/services/middelware._service.dart';

class WelcomePageController extends GetxController {
  final NetworkServiceImpl networkService = Get.find<NetworkServiceImpl>();
  RxBool isConnected = false.obs;
  MiddelWare middelWare = Get.find<MiddelWare>();

  @override
  void onInit() {
    super.onInit();
    checkConnection();
  }

  Future<RxBool> checkConnection() async {
    isConnected.value = await networkService.isConnected();
    return isConnected;
  }

  
  // showProgressIndicator() async {}
}
