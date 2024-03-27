import 'package:firebase_learn/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();

  void signIn() {
    if (formKey.currentState!.validate()) {}
  }

  void googleSignIn() {}

  void navigateToSignUp() {
    Get.toNamed(Routes.register);
  }
}
