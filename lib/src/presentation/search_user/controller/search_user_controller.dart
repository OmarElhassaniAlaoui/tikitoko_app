import 'package:get/get.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/domain/entities/user_entity.dart';
import 'package:tikto_app/src/domain/usecases/get_user_usecase.dart';

class SearchUserController extends GetxController { 
final GetUserUseCase getUserUseCase;
final RxList<UserEntity> userList = RxList<UserEntity>([]);
SearchUserController({required this.getUserUseCase});

LocalStorageService service = Get.find<LocalStorageService>();

Future<void> fetchUser() async {
    final result = await getUserUseCase.call();
    result.fold(
      (failure) => print(failure), // Handle error
      (users) => userList.assignAll(users),
    );
}




}
