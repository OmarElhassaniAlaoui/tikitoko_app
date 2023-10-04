import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/app/routes/app_routes.dart';
import 'package:tikto_app/src/presentation/welcome_page/pages/welcome_page.dart';

class TiktoApp extends StatelessWidget {
  const TiktoApp({super.key});
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  WelcomePage(),
      initialRoute: '/',
      getPages: routes,
    );
  }
}
