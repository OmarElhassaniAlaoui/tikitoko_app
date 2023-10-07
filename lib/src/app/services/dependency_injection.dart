import 'package:get/get.dart';
import 'package:tikto_app/src/app/core/services/api_service.dart';
import 'package:tikto_app/src/app/services/http_service_impl.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/app/services/middelware._service.dart';
import 'package:tikto_app/src/app/services/network_service_impl.dart';
import 'package:tikto_app/src/data/datasource/remote_data_sourece/firebase_remote_data_src.dart';
import 'package:tikto_app/src/data/datasource/remote_data_sourece/user_remote_data_src.dart';
import 'package:tikto_app/src/data/repositories/firebase_repository_impl.dart';
import 'package:tikto_app/src/data/repositories/user_repository_impl.dart';
import 'package:tikto_app/src/domain/repositories/firebase_repository.dart';
import 'package:tikto_app/src/domain/repositories/user_repository.dart';
import 'package:tikto_app/src/domain/usecases/firebase_usecases/get_create_current_user_usecase.dart';
import 'package:tikto_app/src/domain/usecases/firebase_usecases/google_auth_usecase.dart';
import 'package:tikto_app/src/domain/usecases/firebase_usecases/sign_in_anonyimos.dart';
import 'package:tikto_app/src/domain/usecases/firebase_usecases/sign_in_email_passwd_usecase.dart';
import 'package:tikto_app/src/domain/usecases/get_following_list_usecase.dart';
import 'package:tikto_app/src/domain/usecases/get_user_state_usecase.dart';
import 'package:tikto_app/src/domain/usecases/get_user_usecase.dart';
import 'package:tikto_app/src/presentation/auth/controller/auth_controller.dart';
import 'package:tikto_app/src/presentation/home_page/controller/user_state_controller.dart';
import 'package:tikto_app/src/presentation/search_user/controller/search_user_controller.dart';
import 'package:http/http.dart' as http;

void initDependencies() {
  // Register your dependencies here
  ///
  ///========<App Services>========================
  Get.put<ApiService>(HttpServiceImpl(http.Client()), permanent: true);
  Get.putAsync(() => LocalStorageService().init());
  Get.lazyPut(() => NetworkServiceImpl());
  Get.put<NetworkServiceImpl>(NetworkServiceImpl());
  Get.put(MiddelWare());
  //==================== Repositories ================================================
  Get.put<UserRemoteDataSource>(
      UserRemoteDataSource(api: Get.find<ApiService>()));
  Get.put<BaseUserRemoteDataSource>(
      UserRemoteDataSource(api: Get.find<ApiService>()));

  Get.lazyPut(() => FirebaseRemoteDataSrc());
  Get.put<BaseUserRepository>(
    UserRepositoryImpl(
      userRemoteDataSource: Get.find<BaseUserRemoteDataSource>(),
      networkServiceImpl: Get.find<NetworkServiceImpl>(),
    ),
  );
  Get.put<FirebaseRepository>(
    FirebaseRepositoryImpl(
      networkServiceImpl: Get.find<NetworkServiceImpl>(),
      firebaseRemoteDataSrc: Get.find<FirebaseRemoteDataSrc>(),
    ),
  );

  //========================= UseCases ====================================
  Get.put<GetUserUseCase>(GetUserUseCase(Get.find<BaseUserRepository>()));
  Get.put<GetUserStateUsecase>(
      GetUserStateUsecase(Get.find<BaseUserRepository>()));
  Get.put<GetUsersListUseCase>(
      GetUsersListUseCase(Get.find<BaseUserRepository>()));

  //========================= Firebase use case ====================================
  Get.put<GoogleSignInUseCase>(
      GoogleSignInUseCase(firebaseRepository: Get.find<FirebaseRepository>()));
  Get.put<SignInAnonymUseCas>(
      SignInAnonymUseCas(Get.find<FirebaseRepository>()));
  Get.put<SignInWithEmailAndPasswdUsC>(SignInWithEmailAndPasswdUsC(
      firebaseRepository: Get.find<FirebaseRepository>()));
  Get.put<GetCreateCurrentUserUseCase>(
      GetCreateCurrentUserUseCase(repository: Get.find<FirebaseRepository>()));
  //========================= Controllers ====================================
  // Get.put<TemplateController>(
  //     TemplateController(getUsersListUseCase: Get.find<GetUsersListUseCase>()));
  Get.lazyPut(
      () => SearchUserController(getUserUseCase: Get.find<GetUserUseCase>()));
  Get.put(UserStateController(getUserStateUsecase: Get.find()));
  //=========================firbase Auth controller ====================================
  Get.put<AuthController>(AuthController(
    googleSignInUseCase: Get.find<GoogleSignInUseCase>(),
    signInAnonymUseCas: Get.find<SignInAnonymUseCas>(),
    signInWithEmailAndPasswdUsC: Get.find<SignInWithEmailAndPasswdUsC>(),
  ));
}
