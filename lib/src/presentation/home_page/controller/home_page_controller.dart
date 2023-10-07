import 'package:get/get.dart';
import 'package:tikto_app/src/app/helpers/number_shorter.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/domain/entities/user_firebase_entity.dart';
import 'package:tikto_app/src/domain/usecases/firebase_usecases/get_create_current_user_usecase.dart';
import 'package:tikto_app/src/presentation/home_page/model/account_state_model.dart';
import 'package:tikto_app/src/presentation/home_page/model/feeling_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final feelings = <Feeling>[
    Feeling("Love", "assets/images/love.png"),
    Feeling("Happy", "assets/images/happy.png"),
    Feeling("Cool", "assets/images/cool.png"),
    Feeling("Sad", "assets/images/sad.png"),
  ].obs;
  NumberShorter numberShorter = NumberShorter();

  String shortNumber(int number) {
    return numberShorter.shorten(number);
  }

  LocalStorageService service = Get.find<LocalStorageService>();

  final RxInt selectedFeelingIndex = RxInt(-1);

  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase =
      Get.find<GetCreateCurrentUserUseCase>();

  Future<void> toggleFeeling(int index) async {
    final prefs = await SharedPreferences.getInstance();

    if (selectedFeelingIndex.value == index) {
      // If the same feeling is tapped again, deselect it
      feelings[index].deselect();
      selectedFeelingIndex.value = -1;
      await prefs.remove("selectedFeeling");
    } else {
      // Deselect the currently selected feeling (if any)
      if (selectedFeelingIndex.value != -1) {
        feelings[selectedFeelingIndex.value].deselect();
      }
      // Select the new feeling
      feelings[index].select();
      selectedFeelingIndex.value = index;
      await prefs.setString("selectedFeeling", feelings[index].name);
    }
  }
  // Load the saved feeling on app startup

  Future<void> loadSavedFeeling() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFeeling = prefs.getString("selectedFeeling");
    if (savedFeeling != null) {
      final index =
          feelings.indexWhere((feeling) => feeling.name == savedFeeling);
      if (index != -1) {
        feelings[index].select();
        selectedFeelingIndex.value = index;
      }
    }
  }
  // Reset the selected feeling when a new day starts

  Future<void> resetFeelingIfNewDay() async {
    final prefs = await SharedPreferences.getInstance();
    final lastSelectedDate = prefs.getString('lastSelectedDate');
    final currentDate =
        DateTime.now().toString().split(' ')[0]; // Get the current date

    if (lastSelectedDate != currentDate) {
      // It's a new day, reset the selected feeling
      selectedFeelingIndex.value = -1;
      await prefs.remove('selectedFeeling');
      prefs.setString('lastSelectedDate', currentDate);
    }
  }

  List<AccountStatModel> accountStatList = [];
  
  void getAccountStat() {
    accountStatList = AccountStatModel.getAccountStatus();
  }

  void registerDataToFireStore() {
    getCreateCurrentUserUseCase.call(
      UserFirebaseEntity(
        uid: service.sharedPreferences.getString("uid")??"No uid",
        nickName: service.sharedPreferences.getString("nickname")?? "No name",
        email: service.sharedPreferences.getString("email")?? "No email",
        password: service.sharedPreferences.getString("password")?? "No password",
        avatarThumb: service.sharedPreferences.getString("avatarThumb")?? "No avatar",
        followerCount: service.sharedPreferences.getInt("followerCount").toString(), 
        followingCount: service.sharedPreferences.getInt("followingCount").toString(),
        heartCount: service.sharedPreferences.getInt("heartCount").toString(),
        videoCount: service.sharedPreferences.getInt("videoCount").toString(),
        feeling: service.sharedPreferences.getString("selectedFeeling")?? "No feeling",
      ),
    );
  }

  @override
  void onInit() {
    loadSavedFeeling();
    resetFeelingIfNewDay();
    //! this initializate the account stat list
    getAccountStat();
    //! this register the data to firestore when the home page is opened
    registerDataToFireStore(); 
    super.onInit();
  }

  @override
  void onClose() {
    registerDataToFireStore();
    super.onClose();
  }

}
