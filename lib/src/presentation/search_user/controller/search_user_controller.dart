import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/domain/entities/user_entity.dart';
import 'package:tikto_app/src/domain/usecases/get_user_usecase.dart';

class SearchUserController extends GetxController {
  final GetUserUseCase getUserUseCase;
  final RxList<UserEntity> userList = RxList<UserEntity>([]);

  SearchUserController({required this.getUserUseCase});

  LocalStorageService service = Get.find<LocalStorageService>();

  RxBool isLoading = false.obs;

  Future<void> fetchUser() async {
    isLoading.value = true;
    final result = await getUserUseCase.call();
    result.fold(
      (failure) => Get.defaultDialog(
        title: "Error",
        middleText: "No internet connection",
        content: SvgPicture.asset("assets/icons/wifi.svg"),
        textConfirm: "Ok",
        onConfirm: () => Get.back(),
      ), // Handle error
      (users) {
        isLoading.value = false;
        userList.assignAll(users);
        service.sharedPreferences.setString("nickname", userList[0].nickname);
        service.sharedPreferences.setString("avatarThumb", userList[0].avatarThumb);
        
      },
    );
  }
}
