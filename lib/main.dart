import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tikto_app/src/app/services/dependency_injection.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/tikto_app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialService() ; 
  await Firebase.initializeApp();
  initDependencies();
  runApp( 
    DevicePreview(
      enabled: false,
      builder: (context) => const TiktoApp(),
    )
  );
}
