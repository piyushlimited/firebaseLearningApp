import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppInputStyles {
  static InputDecorationTheme inputDecorationLight = InputDecorationTheme(
    contentPadding: const EdgeInsets.only(left: 30),
    iconColor: AppColors.black,
    focusColor: AppColors.black,
    hintStyle: const TextStyle(color: AppColors.hintLight),
    labelStyle: const TextStyle(color: AppColors.labelLight),
    floatingLabelStyle: const TextStyle(color: AppColors.floatingLabelLight),
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(50)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(50)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black),
        borderRadius: BorderRadius.circular(50)),
    errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(50)),
  );

  static InputDecorationTheme inputDecorationDark = InputDecorationTheme(
    contentPadding: const EdgeInsets.only(left: 30),
    iconColor: AppColors.white,
    prefixIconColor: AppColors.white,
    hintStyle: const TextStyle(color: AppColors.hintDark),
    labelStyle: const TextStyle(color: AppColors.labelDark),
    floatingLabelStyle: const TextStyle(color: AppColors.floatingLabelDark),
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(50)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.whiteLight),
        borderRadius: BorderRadius.circular(50)),
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white),
        borderRadius: BorderRadius.circular(50)),
    errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(50)),
  );
}
