import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController nameController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();

  void signUp() {
    if (formKey.currentState!.validate()) {}
  }

  void googleSignUp() {}
}
