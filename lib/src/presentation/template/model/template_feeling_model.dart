import 'package:get/get.dart';

class Feeling {
  final String name;
  final String feelingIcon;
  final RxBool selected;

  Feeling(this.name , this.feelingIcon) : selected = false.obs;

  // Add a method to select this feeling and deselect others
  void select() {
    selected.value = true;
  }

  // Add a method to deselect this feeling
  void deselect() {
    selected.value = false;
  }

}