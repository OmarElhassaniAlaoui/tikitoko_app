
import 'package:get/get.dart';

class FeelingModel {
  String? feeling;
  String? feelingIcon;
  RxBool? isFeelingPressed;

  FeelingModel({
    this.feeling,
    this.feelingIcon,
    this.isFeelingPressed,
  });

  static RxList<FeelingModel> getFeeling() {
    
    RxList<FeelingModel> feelings = <FeelingModel>[].obs;

    feelings.add(FeelingModel(
      feeling: 'Love',
      feelingIcon: 'assets/images/love.png',
      isFeelingPressed: false.obs,
    ));

    feelings.add(FeelingModel(
      feeling: 'Cool',
      feelingIcon: 'assets/images/cool.png',
      isFeelingPressed: false.obs,
    ));

    feelings.add(FeelingModel(
      feeling: 'Happy',
      feelingIcon: 'assets/images/happy.png',
      isFeelingPressed: false.obs,
    ));

    feelings.add(FeelingModel(
      feeling: 'Sad',
      feelingIcon: 'assets/images/sad.png',
      isFeelingPressed: false.obs,
    ));

    return feelings;
  }
}