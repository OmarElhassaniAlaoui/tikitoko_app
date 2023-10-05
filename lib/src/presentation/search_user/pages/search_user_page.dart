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
                  } else if (!value.startsWith("@") &&
                      value != "@${controller.userList[0].nickname}") {
                    return "Please enter your username with @";
                  } else {
                    // save the value to share preference
                    service.sharedPreferences.setString("username", value);
                    return null;
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          ButtonWidget(
            text: 'Search',
            height: 50,
            width: 200,
            onPressed: () async {
              await controller.fetchUser();
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                Get.toNamed(
                  AppPages.home,
                );
              }
            },
          ),
        ],
      )),
    );
  }
}
