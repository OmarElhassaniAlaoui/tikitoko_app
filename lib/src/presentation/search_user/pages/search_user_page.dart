import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/app/helpers/validators.dart';
import 'package:tikto_app/src/app/routes/app_pages.dart';
import 'package:tikto_app/src/app/services/local_storage.dart';
import 'package:tikto_app/src/presentation/search_user/controller/search_user_controller.dart';

class SearchUserPage extends GetView<SearchUserController> {
  SearchUserPage({Key? key}) : super(key: key);
  // create global key for form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
              key: _formKey,
              child: TextFormField(
                controller: _usernameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: "@Username",
                  // labelText: '@Username',
                ),
                validator: (value) {
                  Validator.validateUserName(value!, controller);
                  service.sharedPreferences.setString("username", value);
                  return null;
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          SearchButton(formKey: _formKey,),
        ],
      )),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required GlobalKey<FormState> formKey,

  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;


  @override
  Widget build(BuildContext context) {
    Get.put(SearchUserController(getUserUseCase: Get.find()));

    return ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {    
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Processing Data'),
              ),
            );
          }
          Get.toNamed(
            AppPages.home,
          );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        child: const Text(
          'Submit',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ));
  }
}
