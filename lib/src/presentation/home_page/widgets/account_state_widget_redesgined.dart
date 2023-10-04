import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/home_page/controller/home_page_controller.dart';
import 'package:tikto_app/src/presentation/home_page/controller/user_state_controller.dart';

class AccountStateRedesigned extends StatelessWidget {
  const AccountStateRedesigned({
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.7,
          ),
          shrinkWrap: true,
          itemCount: homeController.accountStatList.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: homeController.accountStatList[index].color,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                horizontalTitleGap: 3,
                leading: SvgPicture.asset(
                  homeController.accountStatList[index].icon,
                  height: 30,
                  width: 30,
                ),
                title: Text(
                  homeController.accountStatList[index].title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  homeController.shortNumber(
                    homeController.accountStatList[index].value,
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => Get.toNamed(
                    homeController.accountStatList[index].routeName),
              ),
            );
          },
        );
      }
    });
  }
}
