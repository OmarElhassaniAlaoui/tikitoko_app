import 'package:get/get.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
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
  LocalStorageService service = Get.find<LocalStorageService>();




  final RxInt selectedFeelingIndex = RxInt(-1);
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

  @override
  void onInit() {
    loadSavedFeeling();
    resetFeelingIfNewDay();
    getAccountStat();
    super.onInit();
  }
}
