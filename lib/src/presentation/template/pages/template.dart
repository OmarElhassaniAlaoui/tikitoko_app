import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/presentation/template/controller/template_controller.dart';
import 'package:tikto_app/src/presentation/template/widgets/show_data_widget.dart';

class Template extends GetView<TemplateController> {
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
                  controller.fetchUser();
                  
                },
                child: const Text('Button')),
            ShowDataWidget(controller:controller), 
          ],
        ),
      ),
    );
  }
}
