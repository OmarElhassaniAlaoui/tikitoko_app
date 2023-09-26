import 'package:flutter/material.dart';
import 'package:tikto_app/src/tikto_app.dart';

import 'src/presentation/template/binds/initial_binding.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  // await initialState(); 
  initDependencies();
  runApp(const TiktoApp());
}
