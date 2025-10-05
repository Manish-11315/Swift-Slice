import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightBackgroundColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.lightTextColor),
      bodyMedium: TextStyle(color: AppColors.lightTextColor),
    ),
    // Add more theme properties
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBackgroundColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.darkTextColor),
      bodyMedium: TextStyle(color: AppColors.darkTextColor),
    ),
    // Add more theme properties
  );
}
