import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/home_page/pages/home._page.dart';
import 'package:tikto_app/src/presentation/template/controller/template_controller.dart';

class Template extends StatelessWidget {
  Template({super.key});

  final controller = Get.put(FeelingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Template'),
            SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: controller.feelings.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final feeling = controller.feelings[index];
                    return Obx(() => Container(
                              height: 120,
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    height: 80,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: feeling.selected.value
                                          ? Colors.blue
                                          : Colors.grey,
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
                )),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const HomePage());
                },
                child: const Text('Button'))
          ],
        ),
      ),
    );
  }
}
