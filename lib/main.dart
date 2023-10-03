import 'package:flutter/material.dart';
import 'package:tikto_app/src/app/services/dependency_injection.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/tikto_app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialService() ; 
  initDependencies();
  runApp(const TiktoApp());
}
