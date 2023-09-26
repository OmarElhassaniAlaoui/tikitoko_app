// dependency_injection.dart

import 'package:get/get.dart';
import 'package:tikto_app/src/app/core/services/api_service.dart';
import 'package:tikto_app/src/app/services/http_service_impl.dart';
import 'package:tikto_app/src/app/services/network_service_impl.dart';
import 'package:tikto_app/src/data/datasource/remote_data_sourece/user_remote_data_src.dart';
import 'package:tikto_app/src/data/repositories/user_repository_impl.dart';
import 'package:tikto_app/src/domain/repositories/user_repository.dart';
import 'package:tikto_app/src/domain/usecases/get_user_usecase.dart';
import 'package:tikto_app/src/presentation/template/controller/template_controller.dart';
import 'package:http/http.dart' as http;

void initDependencies() {
  // Register your dependencies here
  Get.put<ApiService>(HttpServiceImpl(http.Client()), permanent: true);
  Get.put<UserRemoteDataSource>(
      UserRemoteDataSource(api: Get.find<ApiService>()));

  Get.put<NetworkServiceImpl>(NetworkServiceImpl());
  Get.put<BaseUserRemoteDataSource>(
      UserRemoteDataSource(api: Get.find<ApiService>()));
  Get.put<BaseUserRepository>(
    UserRepositoryImpl(
      userRemoteDataSource: Get.find<BaseUserRemoteDataSource>(),
      networkServiceImpl: Get.find<NetworkServiceImpl>(),
    ),
  );
  Get.put<GetUserUseCase>(GetUserUseCase(Get.find<BaseUserRepository>()));
  Get.put<TemplateController>(
      TemplateController(getUserUseCase: Get.find<GetUserUseCase>()));
}
