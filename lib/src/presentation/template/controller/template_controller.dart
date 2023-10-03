import 'package:get/get.dart';
import 'package:tikto_app/src/domain/entities/following_entities/users_entity.dart';
import 'package:tikto_app/src/domain/usecases/get_following_list_usecase.dart';

class TemplateController extends GetxController {
  final GetUsersListUseCase getUsersListUseCase;
  final RxList<UsersEntity> userList = RxList<UsersEntity>([]); 
  TemplateController({required this.getUsersListUseCase});
  Future<void> fetchUsersList() async {
    final result = await getUsersListUseCase.call();
    result.fold(
      (failure) => Get.defaultDialog( 
        title: "Error",
        middleText: failure.toString(),
        textConfirm: "Ok",
        onConfirm: () => Get.back(),
      )  ,  // Handle error
      (users) => userList.assignAll(users),
    );
  } 
  
  


  @override
  void onInit() {
    fetchUsersList();
    super.onInit();
  }


















  // // this for get userState data from api
  // final GetUserStateUsecase getUserStateUsecase;

  // final RxList<UserStateEntity> userStateList = RxList<UserStateEntity>([]);
  // TemplateController({required this.getUserStateUsecase});

  // LocalStorageService service = Get.find<LocalStorageService>();

  // Future<void> fetchUserState() async {
  //   final result = await getUserStateUsecase.call();
  //   result.fold(
  //     (failure) => print(failure), // Handle error
  //     (users) => userStateList.assignAll(users),
  //   );

  //   service.sharedPreferences
  //       .setInt("followerCount", userStateList[0].followerCount);
  //   service.sharedPreferences
  //       .setInt("followingCount", userStateList[0].followingCount);
  //   service.sharedPreferences.setInt("videoCount", userStateList[0].videoCount);
  //   service.sharedPreferences.setInt("diggCount", userStateList[0].diggCount);
  //   service.sharedPreferences.setInt("heartCount", userStateList[0].heartCount);
    
  // }

  //note:this for  getuser data from api
  // final GetUserUseCase getUserUseCase;
  // final RxList<UserEntity> userList = RxList<UserEntity>([]);

  // TemplateController({required this.getUserUseCase});
  // LocalStorageService service = Get.find<LocalStorageService>();
  // Future<void> fetchUser() async {
  //   final result = await getUserUseCase.call();
  //   result.fold(
  //     (failure) => print(failure), // Handle error
  //     (users) => userList.assignAll(users),
  //   );
  //   service.sharedPreferences.setString("avatarLarger",userList[0].avatarLarger);
  //   service.sharedPreferences.setString("avatarThumb",userList[0].avatarThumb);
  // }

  // @override
  // void onInit() {

  //   // fetchUserState();
  //   // fetchUser();
  //   super.onInit();
  // }
}
