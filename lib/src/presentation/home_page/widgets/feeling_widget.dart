import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/home_page/controller/home_page_controller.dart';

class FeelingWidget extends StatelessWidget {
  const FeelingWidget({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: ListView.builder(
          itemCount: controller.feelings.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final feeling = controller.feelings[index];
            return Obx(
              () => Container(
                height: 120,
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color:
                            feeling.selected.value ? Colors.blue : Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          controller.toggleFeeling(index);
                        },
                        child: Image.asset(
                          controller.feelings[index].feelingIcon,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.feelings[index].name,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
