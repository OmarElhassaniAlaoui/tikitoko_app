import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/app/routes/app_pages.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/app/widgets/buttom_widget.dart';
import 'package:tikto_app/src/presentation/search_user/controller/search_user_controller.dart';

class SearchUserPage extends GetView<SearchUserController> {
  SearchUserPage({Key? key}) : super(key: key);
  // create global key for form
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // creat controller for textfield
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final service = Get.put(LocalStorageService());
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Enter your TikTok username",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: formKey,
              child: TextFormField(
                controller: _usernameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: "@Username",
                  // labelText: '@Username',
                ),
                onSaved: (newValue) => _usernameController.text = newValue!,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your username";
                  } else if (value.length < 3) {
                    return "Please enter a valid username";
                  }
                  service.sharedPreferences.setString(
                      "username", _usernameController.text);
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Obx(() {
            return controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : ButtonWidget(
                    text: 'Search',
                    height: 50,
                    width: 200,
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        await controller.fetchUser();
                        Get.toNamed(
                          AppPages.home,
                        );
                      }
                    },
                  );
          }),
        ],
      )),
    );
  }
}
