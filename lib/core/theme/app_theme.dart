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
      onSurface: AppColors.gold,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 22, color: AppColors.gold),
      titleMedium: TextStyle(fontSize: 20, color: AppColors.gold),
      titleSmall: TextStyle(fontSize: 18, color: AppColors.gold),
      labelLarge: TextStyle(fontSize: 20, color: AppColors.white),
      labelMedium: TextStyle(fontSize: 18, color: AppColors.white),
      labelSmall: TextStyle(fontSize: 16, color: AppColors.white),
      bodyLarge: TextStyle(fontSize: 16, color: AppColors.white),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.white),
      bodySmall: TextStyle(fontSize: 12, color: AppColors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: AppColors.gold),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: AppColors.gold),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: AppColors.gold),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: AppColors.gold),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(width: 1, color: Colors.red),
      ),
      prefixIconColor: AppColors.gold,
      suffixIconColor: AppColors.gold,
      hintStyle: TextStyle(fontSize: 16, color: Colors.white),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.gold,
        backgroundColor: Colors.transparent,
        textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.all(16),
        backgroundColor: AppColors.gold,
        foregroundColor: AppColors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        )
      )
    )
  );
}
