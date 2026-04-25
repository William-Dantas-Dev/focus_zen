import 'package:flutter/material.dart';

import 'app_colors.dart';

class LightTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      fontFamily: 'Inter',
      scaffoldBackgroundColor: AppColors.lightBackground,

      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        tertiary: AppColors.tertiary,
        surface: AppColors.lightSurface,
        error: AppColors.error,
        onPrimary: AppColors.tertiary,
        onSecondary: Colors.white,
        onSurface: AppColors.lightTextPrimary,
        onError: Colors.white,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: AppColors.lightTextPrimary,
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.lightTextPrimary,
          fontSize: 64,
          fontWeight: FontWeight.w800,
          letterSpacing: -2,
        ),
        headlineLarge: TextStyle(
          color: AppColors.lightTextPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: 4,
        ),
        titleMedium: TextStyle(
          color: AppColors.lightTextSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          color: AppColors.lightTextSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelMedium: TextStyle(
          color: AppColors.lightTextSecondary,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 3,
        ),
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.tertiary,
          minimumSize: const Size(64, 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          elevation: 6,
        ),
      ),

      cardTheme: CardThemeData(
        color: AppColors.lightCard,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}