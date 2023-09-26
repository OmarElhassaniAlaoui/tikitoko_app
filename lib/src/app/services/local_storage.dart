import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService extends GetxService {

  late SharedPreferences sharedPreferences;
  Future<LocalStorageService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

 

  // static Future<void> saveData(String key, String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(key, value);
  // }

  // static Future<String> getData(String key) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(key).toString();
  // }

  // static Future<void> removeData(String key) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.remove(key);
  // }
}
 initialService() async {
    await Get.putAsync(() => LocalStorageService().init()); 
}