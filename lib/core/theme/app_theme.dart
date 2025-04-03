import 'package:flutter/material.dart';
import 'package:islami_app_fue/core/theme/app_colors.dart';

abstract class AppTheme {
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.gold,
      onPrimary: AppColors.black,
      secondary: AppColors.white,
      onSecondary: AppColors.black,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.black,
      onSurface: AppColors.black,
    ),
  );
}
