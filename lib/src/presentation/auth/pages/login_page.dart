import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tikto_app/src/app/widgets/buttom_widget.dart';
import 'package:tikto_app/src/presentation/auth/controller/auth_controller.dart';
import 'package:tikto_app/src/presentation/search_user/pages/search_user_page.dart';

class LoginPage extends GetView<AuthController> {
  LoginPage({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController(
      googleSignInUseCase: Get.find(),
    ));
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text('Welcome to Tikto App'),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Email"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            isDense: true,
                            prefixIcon: Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Password"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            isDense: true,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ButtonWidget(
                            text: 'Login',
                            width: double.infinity,
                            height: 50,
                            onPressed: () {
                              // validate form
                              if (formKey.currentState!.validate()) {
                                Get.to(() => SearchUserPage());
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("or", style: TextStyle(fontSize: 25)),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              await authController.googleSignIn();
                              Get.to(() => SearchUserPage());
                            },
                            icon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                'assets/icons/google.svg',
                                width: 24,
                                height: 24,
                              ),
                            ),
                            label: const Text(
                              "Login with Google",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              fixedSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
