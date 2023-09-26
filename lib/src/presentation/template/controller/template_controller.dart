import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/template/model/template_feeling_model.dart';

class FeelingsController extends GetxController {
  final feelings = <Feeling>[
    Feeling("Love" , "assets/images/love.png"),
    Feeling("Happy", "assets/images/happy.png"),
    Feeling("Cool" , "assets/images/cool.png"),
    Feeling("Sad", "assets/images/sad.png"),
  ].obs;
    // The index of the currently selected feeling
  final RxInt selectedFeelingIndex = RxInt(-1);
  
  // Function to toggle feeling selection
  void toggleFeeling(int index) {
     if (selectedFeelingIndex.value == index) {
      // If the same feeling is tapped again, deselect it
      feelings[index].deselect();
      selectedFeelingIndex.value = -1; // No feeling selected
    } else {
      // Deselect the currently selected feeling (if any)
      if (selectedFeelingIndex.value != -1) {
        feelings[selectedFeelingIndex.value].deselect();
      }
      // Select the new feeling
      feelings[index].select();
      selectedFeelingIndex.value = index;
    }
  }
}