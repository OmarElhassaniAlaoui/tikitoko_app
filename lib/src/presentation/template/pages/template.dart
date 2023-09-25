import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/home_page/pages/home._page.dart';

class Template extends StatelessWidget {
  const Template({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Template'),
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
