import 'package:firebase_learn/presentation/controllers/authentication/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/app_padding.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/text_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'SIGN UP'),
      body: SingleChildScrollView(
        child: Padding(
          padding: appScreenPadding,
          child: Form(
            key: _controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/plant1.jpg',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  'Welcome!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextWidget.textFormField(
                    labelText: 'Full Name',
                    hintText: 'Enter your full names',
                    controller: _controller.nameController,
                    currentFocus: _controller.nameFocusNode,
                    nextFocus: _controller.emailFocusNode,
                    validator: (val) {
                      if (val.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                TextWidget.textFormField(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    controller: _controller.emailController,
                    currentFocus: _controller.emailFocusNode,
                    nextFocus: _controller.passwordFocusNode,
                    validator: (val) {
                      if (val.isEmpty || !val.toString().isEmail) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 20.0,
                ),
                TextWidget.passwordFormField(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    controller: _controller.passwordController,
                    currentFocus: _controller.passwordFocusNode,
                    nextFocus: null,
                    validator: (val) {
                      if (val.isEmpty || val.length < 8) {
                        return 'Please enter a valid 8 characters password';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 40.0,
                ),
                ButtonWidget.elevatedButton(
                    context: context,
                    onPressed: _controller.signUp,
                    child: const Text('SIGN UP')),
                const SizedBox(
                  height: 20.0,
                ),
                ButtonWidget.elevatedButton(
                    context: context,
                    onPressed: _controller.googleSignUp,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/google_icon.png",
                        ),
                        const Text("SIGN UP WITH GOOGLE")
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
