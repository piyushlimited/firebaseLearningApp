import 'package:get/get.dart';

class PasswordFieldController extends GetxController {
  var obscureText = true.obs;

  void togglePasswordVisibility() {
    obscureText.toggle();
  }
}
