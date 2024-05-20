import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColorLight = Color.fromARGB(255, 170, 168, 168);
  static const Color primaryColorDark = Color(0xFF424242);

  static const Color accentColor = Color(0xFF12E450);

  static const Color backgroundColorLight = Color(0xFFEBEBEB);
  static const Color backgroundColorDark = Color(0xFF303030);

  static const Color textColorLight = Color(0xFF303030);
  static const Color textColorDark = Color(0xFFEBEBEB);

  static const Color buttonTextColorLight = accentColor;
  static const Color buttonTextColorDark = textColorLight;

  static const Color buttonBackgroundColorLight = textColorLight;
  static const Color buttonBackgroundColorDark = accentColor;
}

const appBarThemeLight = AppBarTheme(
  color: AppColors.backgroundColorDark,
  centerTitle: true,
  titleTextStyle: TextStyle(
    color: AppColors.accentColor,
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  ),
  iconTheme: IconThemeData(color: AppColors.textColorDark),
);

const appBarThemeDark = AppBarTheme(
  color: AppColors.backgroundColorDark,
  centerTitle: true,
  titleTextStyle: TextStyle(
    color: AppColors.accentColor,
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  ),
  iconTheme: IconThemeData(color: AppColors.textColorDark),
);

const bottomNavigationBarThemeLight = BottomNavigationBarThemeData(
  backgroundColor: AppColors.primaryColorDark,
  selectedItemColor: AppColors.accentColor,
  selectedLabelStyle: TextStyle(color: AppColors.accentColor),
  unselectedItemColor: AppColors.textColorDark,
  unselectedLabelStyle: TextStyle(color: AppColors.textColorDark),
);

const bottomNavigationBarThemeDark = BottomNavigationBarThemeData(
  backgroundColor: AppColors.primaryColorDark,
  selectedItemColor: AppColors.accentColor,
  selectedLabelStyle: TextStyle(color: AppColors.accentColor),
  unselectedItemColor: AppColors.textColorDark,
  unselectedLabelStyle: TextStyle(color: AppColors.textColorDark),
);

const textThemeLight = TextTheme(
  titleLarge: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColorLight,
  ),
  bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: AppColors.textColorLight),
);

const textThemeDark = TextTheme(
  titleLarge: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColorDark,
  ),
  bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.normal,
      color: AppColors.textColorDark),
);

const elevatedButtonThemeLight = ElevatedButtonThemeData(
    style: ButtonStyle(
  backgroundColor:
      MaterialStatePropertyAll(AppColors.buttonBackgroundColorLight),
  foregroundColor: MaterialStatePropertyAll(AppColors.buttonTextColorLight),
  textStyle: MaterialStatePropertyAll(
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
  padding: MaterialStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0)),
));

const elevatedButtonThemeDark = ElevatedButtonThemeData(
    style: ButtonStyle(
  backgroundColor:
      MaterialStatePropertyAll(AppColors.buttonBackgroundColorDark),
  foregroundColor: MaterialStatePropertyAll(AppColors.buttonTextColorDark),
  textStyle: MaterialStatePropertyAll(
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
  padding: MaterialStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0)),
));

final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    fontFamilyFallback: const ['sans-serif'],
    primaryColor: AppColors.primaryColorLight,
    scaffoldBackgroundColor: AppColors.backgroundColorLight,
    appBarTheme: appBarThemeLight,
    bottomNavigationBarTheme: bottomNavigationBarThemeLight,
    textTheme: textThemeLight,
    elevatedButtonTheme: elevatedButtonThemeLight);

final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    fontFamilyFallback: const ['sans-serif'],
    primaryColor: AppColors.primaryColorDark,
    scaffoldBackgroundColor: AppColors.backgroundColorDark,
    appBarTheme: appBarThemeDark,
    bottomNavigationBarTheme: bottomNavigationBarThemeDark,
    textTheme: textThemeDark,
    elevatedButtonTheme: elevatedButtonThemeDark);
