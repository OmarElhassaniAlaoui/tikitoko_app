
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/home_page/controller/home_page_controller.dart';

class FeelingWidget extends StatelessWidget {
  const FeelingWidget({
    super.key,
    required this.homeController,
    required this.controller,
  });

  final HomeController homeController;
  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: homeController.feelings.length,
        itemBuilder: (context, index) {
          return SizedBox(
            child: Row(
              children: [
                Container(
                  height: 120,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() => Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                              color: homeController
                                      .feelings[index].isFeelingPressed!.value
                                  ? Colors.green
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                controller.changeFeeling(index);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.asset(
                                    controller.feelings[index].feelingIcon!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${controller.feelings[index].feeling}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
