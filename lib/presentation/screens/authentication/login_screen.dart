import 'package:firebase_learn/presentation/controllers/authentication/login_controller.dart';
import 'package:firebase_learn/presentation/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: CommonAppBar(title: 'Login'));
  }
}
