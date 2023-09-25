import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/home_page/controller/home_page_controller.dart';
import 'package:tikto_app/src/presentation/home_page/widgets/account_state_widget.dart';
import 'package:tikto_app/src/presentation/home_page/widgets/feeling_widget.dart';
import 'package:tikto_app/src/presentation/home_page/widgets/header_widget.dart';
import 'package:tikto_app/src/presentation/home_page/widgets/say_hello.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const HeaderWidget(),
              const SizedBox(
                height: 40,
              ),
              const SayHelloWidget(),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                child: Text(
                  'How are you feeling today?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              FeelingWidget(
                homeController: homeController,
                controller: controller,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Your account state",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AccountStatWidget(homeController: homeController),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
