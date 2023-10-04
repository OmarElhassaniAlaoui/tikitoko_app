import 'package:get/get.dart';
import 'package:tikto_app/src/app/helpers/number_shorter.dart';
import 'package:tikto_app/src/domain/entities/following_entities/users_entity.dart';
import 'package:tikto_app/src/domain/usecases/get_following_list_usecase.dart';

class FollowingPageController extends GetxController { 

  final GetUsersListUseCase getUsersListUseCase; 
  FollowingPageController({required this.getUsersListUseCase}); 
  final RxList<UsersEntity> userList = RxList<UsersEntity>([]); 


   NumberShorter numberShorter = NumberShorter();

  Future<void> fetchUsersList() async { 
    final result = await getUsersListUseCase.call(); 
    result.fold( 
      (failure) => Get.defaultDialog( 
        title: "Error",
        middleText: failure.toString(),
        textConfirm: "Ok",
        onConfirm: () => Get.back(),
      )  , // Handle error 
      (users) => userList.assignAll(users), 
    ); 
  } 

  String shurtNumber(int number) { 
    return numberShorter.shorten(number);
  }


  @override
  void onInit() { 
    fetchUsersList(); 
    super.onInit(); 
  }


}
