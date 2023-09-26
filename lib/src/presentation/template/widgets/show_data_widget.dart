import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/template/controller/template_controller.dart';

// ignore: must_be_immutable
class ShowDataWidget extends StatelessWidget {
  ShowDataWidget({super.key, required this.controller});
  TemplateController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        width: 300,
        child: Obx(() {
          if (controller.userList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Text(controller.userList[0].nickname),
                Text(controller.userList[0].avatarThumb),
                Text(controller.userList[0].avatarLarger),
              ],
            );
          }
        }));
  }
}
