import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/following_page/controller/following_page_controller.dart';
import 'package:tikto_app/src/presentation/following_page/widgets/following_list_tail.dart';

class FollwingListPage extends StatelessWidget {
  FollwingListPage({super.key});
  final FollowingPageController followingPageController =
      Get.put(FollowingPageController(getUsersListUseCase: Get.find()));
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Following List'),
        ),
        body: Obx(() {
          if (followingPageController.userList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              itemCount: followingPageController.userList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 10,
                );
              },
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return FollowingListTailWidget(
                  followingPageController: followingPageController,
                  index: index,
                );
              },
            );
          }
        }),
      ),
    );
  }
}
