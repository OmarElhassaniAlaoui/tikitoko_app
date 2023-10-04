import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/home_page/controller/home_page_controller.dart';
import 'package:tikto_app/src/presentation/home_page/controller/user_state_controller.dart';

class AccountStatWidget extends StatelessWidget {
  const AccountStatWidget({
    super.key,
    required this.homeController,
    required this.userStateController,
  });

  final HomeController homeController;
  final UserStateController userStateController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (userStateController.userStateList.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.5,
          ),
          itemCount: homeController.accountStatList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(homeController.accountStatList[index].routeName);
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: homeController.accountStatList[index].color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        homeController.accountStatList[index].icon,
                        height: 40,
                        width: 40,
                      ),
                    ),
                    Text(
                      homeController.accountStatList[index].title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      homeController.shortNumber(
                          homeController.accountStatList[index].value),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }
}
