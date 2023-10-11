import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class LocalStorageService extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<LocalStorageService> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> saveImageLocaly(String imageUrl) async {
    final file = await DefaultCacheManager().getSingleFile(imageUrl);
    final appDir = await getApplicationDocumentsDirectory();
    final localPath = appDir.path;
    final fileName = imageUrl.split("/").last;
    // ignore: unused_local_variable
    final localFile = await file.copy('$localPath/$fileName');
    
  }

  Future<String> getImageLocaly(String imageUrl) async {
    final file = await DefaultCacheManager().getSingleFile(imageUrl);
    final appDir = await getApplicationDocumentsDirectory();
    final localPath = appDir.path;
    final fileName = imageUrl.split("/").last;
    // ignore: unused_local_variable
    final localFile = await file.copy('$localPath/$fileName');
    return localPath;
  }
}

initialService() async {
  await Get.putAsync(() => LocalStorageService().init());
}
