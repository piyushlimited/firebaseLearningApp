import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/widgets/password_field_controller.dart';
import '../themes/app_colors.dart';

class TextWidget {
  static Widget textFormField(
      {required TextEditingController controller,
      String? hintText,
      String? labelText,
      FormFieldValidator? validator,
      TextInputType keyboardType = TextInputType.text,
      bool readOnly = false,
      Icon? icon,
      Icon? prefixIcon,
      required FocusNode currentFocus,
      required FocusNode? nextFocus,
      ValueChanged<String>? onChanged}) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      readOnly: readOnly,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        icon: icon,
        prefixIcon: prefixIcon,
      ),
      focusNode: currentFocus,
      onFieldSubmitted: (val) {
        if (nextFocus != null && currentFocus != nextFocus) {
          currentFocus.unfocus();
          nextFocus.requestFocus();
        }
      },
      onChanged: onChanged,
    );
  }

  static Widget passwordFormField({
    required TextEditingController controller,
    String? hintText,
    String? labelText,
    FormFieldValidator? validator,
    TextInputType keyboardType = TextInputType.text,
    bool readOnly = false,
    Icon? icon,
    Icon? prefixIcon,
    required FocusNode currentFocus,
    required FocusNode? nextFocus,
  }) {
    PasswordFieldController passwordFieldController =
        Get.put(PasswordFieldController());
    return Obx(() => TextFormField(
          controller: controller,
          obscureText: passwordFieldController.obscureText.value,
          validator: validator,
          keyboardType: keyboardType,
          readOnly: readOnly,
          decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            icon: icon,
            prefixIcon: prefixIcon,
            suffixIcon: IconButton(
              style: ButtonStyle(
                  iconColor: MaterialStateProperty.all(AppColors.primary)),
              icon: Icon(
                passwordFieldController.obscureText.value
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: () {
                passwordFieldController.togglePasswordVisibility();
              },
            ),
          ),
          focusNode: currentFocus,
          onFieldSubmitted: (val) {
            if (nextFocus != null && currentFocus != nextFocus) {
              currentFocus.unfocus();
              nextFocus.requestFocus();
            }
          },
        ));
  }
}
