import 'package:get/get.dart';
import 'package:tikto_app/src/domain/entities/following_entities/users_entity.dart';
import 'package:tikto_app/src/domain/usecases/get_following_list_usecase.dart';

class FollowingPageController extends GetxController { 

  final GetUsersListUseCase getUsersListUseCase; 
  FollowingPageController({required this.getUsersListUseCase}); 
  final RxList<UsersEntity> userList = RxList<UsersEntity>([]); 

  Future<void> fetchUsersList() async { 
    final result = await getUsersListUseCase.call(); 
    result.fold( 
      (failure) => print(failure), // Handle error 
      (users) => userList.assignAll(users), 
    ); 
  } 


  @override
  void onInit() { 
    fetchUsersList(); 
    super.onInit(); 
  }


}
