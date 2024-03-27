import 'package:flutter/material.dart';

import 'app_button_styles.dart';
import 'app_colors.dart';
import 'app_input_styles.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.white,
    dialogBackgroundColor: AppColors.white,
    colorScheme: ThemeData().colorScheme.copyWith(
        background: AppColors.white,
        surfaceTint: AppColors.white,
        primary: AppColors.primary),
    iconTheme: const IconThemeData(color: AppColors.black),
    textButtonTheme: AppButtonStyles.textButtonThemeDataLight,
    elevatedButtonTheme: AppButtonStyles.elevatedButtonThemeDataLight,
    dividerColor: AppColors.black,
    cardTheme:
        const CardTheme(color: Colors.white, surfaceTintColor: Colors.white),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primary),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        titleTextStyle: TextStyle(fontSize: 16.0)),
    textTheme: const TextTheme().copyWith(
        headlineLarge: AppTextStyles.headlineLargeLight,
        headlineMedium: AppTextStyles.headlineMediumLight,
        headlineSmall: AppTextStyles.headlineSmallLight,
        bodyLarge: AppTextStyles.bodyLargeLight,
        bodyMedium: AppTextStyles.bodyMediumLight,
        bodySmall: AppTextStyles.bodySmallLight),
    inputDecorationTheme: AppInputStyles.inputDecorationLight,
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.black,
    dialogBackgroundColor: AppColors.black,
    colorScheme: ThemeData().colorScheme.copyWith(
        background: AppColors.black,
        primary: AppColors.primary,
        surfaceTint: AppColors.black),
    textButtonTheme: AppButtonStyles.textButtonThemeDataDark,
    elevatedButtonTheme: AppButtonStyles.elevatedButtonThemeDataDark,
    dividerColor: AppColors.white,
    cardTheme: CardTheme(color: Colors.grey.shade800, shadowColor: Colors.grey),
    iconTheme: const IconThemeData(color: AppColors.white),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: AppColors.primary),
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary, foregroundColor: AppColors.white),
    textTheme: const TextTheme().copyWith(
        headlineLarge: AppTextStyles.headlineLargeDark,
        headlineMedium: AppTextStyles.headlineMediumDark,
        headlineSmall: AppTextStyles.headlineSmallDark,
        bodyLarge: AppTextStyles.bodyLargeDark,
        bodyMedium: AppTextStyles.bodyMediumDark,
        bodySmall: AppTextStyles.bodySmallDark),
    inputDecorationTheme: AppInputStyles.inputDecorationDark,
  );
}
