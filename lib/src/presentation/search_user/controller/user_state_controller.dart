import 'package:get/get.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/domain/entities/user_state_entity.dart';
import 'package:tikto_app/src/domain/usecases/get_user_state_usecase.dart';

class UserStateController extends GetxController {
  final GetUserStateUsecase getUserStateUsecase;
  final RxList<UserStateEntity> userStateList = RxList<UserStateEntity>([]);
  UserStateController({required this.getUserStateUsecase});

  LocalStorageService service = Get.find<LocalStorageService>();
  Future<void> fetchUserState() async {
    final result = await getUserStateUsecase.call();
    result.fold(
      (failure) => print(failure), // Handle error
      (users) => userStateList.assignAll(users),
    );

    service.sharedPreferences.setInt(
      "followerCount", userStateList[0].followerCount,
    );
    service.sharedPreferences.setInt(
      "followingCount", userStateList[0].followingCount,
    );
    service.sharedPreferences.setInt(
      "heartCount", userStateList[0].heartCount,
    );
    service.sharedPreferences.setInt(
      "videoCount", userStateList[0].videoCount,
    );
    service.sharedPreferences.setInt(
      "diggCount", userStateList[0].diggCount,
    );
  }

  @override
  void onInit() {
    fetchUserState();
    super.onInit();
  }
}
