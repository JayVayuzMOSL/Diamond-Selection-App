import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color primaryLight = Color(0xFF1A1AE5);
  static const Color backgroundLight = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFF7F7FC);
  static const Color textLight = Color(0xFF0D0D1C);
  static const Color greyLight = Color(0xFFE8E8F2);
  static const Color greyLightAlt = Color(0xFFD1D1E8);
  static const Color accentLight = Color(0xFF4F4F96);
  static const Color greyColor = Colors.grey;

  // Define ColorScheme for Light and Dark Mode
  static final ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryLight,
    background: backgroundLight,
    surface: surfaceLight,
    onPrimary: Colors.white,
    onBackground: textLight,
    onSurface: textLight,
    error: Colors.red,
    onError: Colors.white,
    secondary: accentLight,
    onSecondary: Colors.white,
  );
}
