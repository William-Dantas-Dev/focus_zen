import 'package:flutter/material.dart';

import 'app_colors.dart';

class DarkTheme {
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      fontFamily: 'Inter',
      scaffoldBackgroundColor: AppColors.darkBackground,

      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        tertiary: AppColors.tertiary,
        surface: AppColors.darkSurface,
        error: AppColors.error,
        onPrimary: AppColors.tertiary,
        onSecondary: AppColors.textPrimary,
        onSurface: AppColors.textPrimary,
        onError: Colors.white,
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: AppColors.textPrimary,
      ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 64,
          fontWeight: FontWeight.w800,
          letterSpacing: -2,
        ),
        headlineLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: 4,
        ),
        titleMedium: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textSecondary,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelMedium: TextStyle(
          color: AppColors.textMuted,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 3,
        ),
      ),

      iconTheme: const IconThemeData(
        color: AppColors.textSecondary,
        size: 24,
      ),

      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.tertiary,
          minimumSize: const Size(64, 64),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
          elevation: 10,
          shadowColor: AppColors.primary.withValues(alpha: 0.35),
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          foregroundColor: AppColors.textSecondary,
          highlightColor: AppColors.primary.withValues(alpha: 0.12),
        ),
      ),

      cardTheme: CardThemeData(
        color: AppColors.darkCard,
        elevation: 0,
        shadowColor: AppColors.primary.withValues(alpha: 0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}