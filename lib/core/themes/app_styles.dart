import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kgk_diamonds_group_app/core/themes/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryLight,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: AppColors.lightColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLight,
      elevation: 2,
      titleTextStyle: _textThemeLight.titleLarge,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    inputDecorationTheme: _inputDecorationTheme,
    textTheme: _textThemeLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundLight,
      selectedItemColor: AppColors.primaryLight,
      unselectedItemColor: AppColors.greyColor,
    ),
  );

  // Common Input Decoration
  static final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    contentPadding: EdgeInsets.symmetric(horizontal: wRes(16), vertical: hRes(12)),
  );

  // Light Theme Text
  static final TextTheme _textThemeLight = GoogleFonts.publicSansTextTheme().copyWith(
  titleLarge: GoogleFonts.publicSans(fontSize: spRes(18), fontWeight: FontWeight.w500),
  titleMedium: GoogleFonts.publicSans(fontSize: spRes(16), fontWeight: FontWeight.w500),
  titleSmall: GoogleFonts.publicSans(fontSize: spRes(14), fontWeight: FontWeight.w400),
  bodyLarge: GoogleFonts.publicSans(fontSize: spRes(16), fontWeight: FontWeight.w400),
  bodyMedium: GoogleFonts.publicSans(fontSize: spRes(15), fontWeight: FontWeight.w400),
  bodySmall: GoogleFonts.publicSans(fontSize: spRes(12), fontWeight: FontWeight.w400),
  displayMedium: GoogleFonts.publicSans(fontSize: spRes(14), fontWeight: FontWeight.w500),
  );
}

// Responsive utility functions
double spRes(double size) => kIsWeb ? size : size.sp;
double wRes(double size) => kIsWeb ? size : size.w;
double hRes(double size) => kIsWeb ? size : size.h;
