import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButtonStyles {
  static TextButtonThemeData textButtonThemeDataLight = TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.bold)));
  static TextButtonThemeData textButtonThemeDataDark = TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: const TextStyle(fontWeight: FontWeight.bold)));
  static ElevatedButtonThemeData elevatedButtonThemeDataLight =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.primary,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)));
  static ElevatedButtonThemeData elevatedButtonThemeDataDark =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              foregroundColor: AppColors.white,
              backgroundColor: AppColors.primary,
              textStyle: const TextStyle(fontWeight: FontWeight.bold)));
}
