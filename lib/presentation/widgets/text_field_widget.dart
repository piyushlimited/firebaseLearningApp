import 'package:flutter/material.dart';

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
}
