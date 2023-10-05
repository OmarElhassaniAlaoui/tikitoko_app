import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/app/routes/app_pages.dart';
import 'package:tikto_app/src/presentation/welcome_page/controller/welcome_page_controller.dart';

class WelcomePage extends GetView<WelcomePageController> {
  WelcomePage({super.key});
  @override
  final WelcomePageController controller = Get.put(WelcomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              'assets/images/welcome.svg',
              height: 250,
              width: 250,
            ),
            const Text(
              'Welcome to Tikto',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  Get.toNamed(AppPages.loginPage);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Get Started')),
          ],
        ),
      ),
    );
  }
}
