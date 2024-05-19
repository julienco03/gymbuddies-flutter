import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF424242);
  static const Color accentColor = Color(0xFF12E450);
  static const Color backgroundColor = Color(0xFF303030);
  static const Color textColor = Color(0xFFEBEBEB);
}

final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    fontFamilyFallback: const ['sans-serif'],
    appBarTheme: const AppBarTheme(
      color: AppColors.backgroundColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.accentColor,
        fontSize: 30,
        fontWeight: FontWeight.w900,
        fontStyle: FontStyle.italic,
      ),
      iconTheme: IconThemeData(color: AppColors.textColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      selectedItemColor: AppColors.accentColor,
      unselectedItemColor: AppColors.textColor,
    ),
    textTheme: TextTheme());
