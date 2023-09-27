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
          if (controller.userFollowingList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: [
                Text(controller.userFollowingList[0].nickname),
                Text(controller.userFollowingList[0].avatarThumb),
                Text(controller.userFollowingList[0].avatarLarger),
                
               
                
              ],
            );
          }











          // if (controller.userStateList.isEmpty) {
          //   return const Center(child: CircularProgressIndicator());
          // } else {
          //   return Column(
          //     children: [
          //       Text(controller.userStateList[0].followerCount.toString()),
          //       Text(controller.userStateList[0].followingCount.toString()),
          //       Text(controller.userStateList[0].videoCount.toString()),
          //       Text(controller.userStateList[0].diggCount.toString()),  
          //     ],
          //   );
          // }



          // if (controller.userList.isEmpty) {
          //   return const Center(child: CircularProgressIndicator());
          // } else {
          //   return Column(
          //     children: [
          //       Text(controller.userList[0].nickname),
          //       Text(controller.userList[0].avatarThumb),
          //       Text(controller.userList[0].avatarLarger),
          //     ],
          //   );
          // }
        }));
  }
}
