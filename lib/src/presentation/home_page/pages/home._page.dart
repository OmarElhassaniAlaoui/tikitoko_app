import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/home_page/controller/home_page_controller.dart';
import 'package:tikto_app/src/presentation/home_page/controller/user_state_controller.dart';
import 'package:tikto_app/src/presentation/home_page/widgets/account_state_widget.dart';
import 'package:tikto_app/src/presentation/home_page/widgets/account_state_widget_redesgined.dart';
import 'package:tikto_app/src/presentation/home_page/widgets/feeling_widget.dart';
import 'package:tikto_app/src/presentation/home_page/widgets/header_widget.dart';
import 'package:tikto_app/src/presentation/home_page/widgets/say_hello.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    final UserStateController userStateController =
        Get.put(UserStateController(getUserStateUsecase: Get.find()));

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
              SayHelloWidget(
                controller: homeController,
              ),
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
                controller: homeController,
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
              AccountStateRedesigned(
                homeController: homeController,
                userStateController: userStateController,
              ),
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
