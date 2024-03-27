import 'package:firebase_learn/presentation/controllers/authentication/login_controller.dart';
import 'package:firebase_learn/presentation/themes/app_colors.dart';
import 'package:firebase_learn/presentation/themes/app_padding.dart';
import 'package:firebase_learn/presentation/widgets/appbar_widget.dart';
import 'package:firebase_learn/presentation/widgets/button_widget.dart';
import 'package:firebase_learn/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'SIGN IN'),
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
                  'Welcome back!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
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
                    onPressed: _controller.signIn,
                    child: const Text('SIGN IN')),
                const SizedBox(
                  height: 20.0,
                ),
                ButtonWidget.elevatedButton(
                    context: context,
                    onPressed: _controller.googleSignIn,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/google_icon.png",
                        ),
                        const Text("SIGN IN WITH GOOGLE")
                      ],
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                GestureDetector(
                  onTap: _controller.navigateToSignUp,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Sign Up',
                        style: TextStyle(color: AppColors.primary),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
