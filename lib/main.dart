import 'package:flutter/material.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/tikto_app.dart';

import 'src/presentation/template/binds/initial_binding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initialService() ; 
  initDependencies();
  runApp(const TiktoApp());
}
