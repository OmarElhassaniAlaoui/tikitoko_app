import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/presentation/home_page/controller/home_page_controller.dart';

// ignore: must_be_immutable
class SayHelloWidget extends StatelessWidget {
  SayHelloWidget({
    super.key,
    required this.controller,
  });
  HomeController controller;
  @override
  Widget build(BuildContext context) {
    final service = Get.put(LocalStorageService());
    return SizedBox(
      child: RichText(
        text: TextSpan(
          text: 'Hello, ',
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: "${service.sharedPreferences.getString("username")}",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
