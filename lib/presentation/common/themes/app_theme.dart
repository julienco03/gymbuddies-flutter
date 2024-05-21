import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColorLight = Color.fromARGB(255, 170, 168, 168);
  static const Color primaryColorDark = Color(0xFF424242);

  static const Color secondaryColorLight = Color.fromARGB(255, 64, 64, 64);
  static const Color secondaryColorDark = Color.fromARGB(255, 243, 243, 243);

  static const Color accentColor = Color(0xFF12E450);

  static const Color backgroundColorLight = Color(0xFFEBEBEB);
  static const Color backgroundColorDark = Color(0xFF303030);

  static const Color textColorLight = Color(0xFF303030);
  static const Color textColorDark = Color(0xFFFFFFFF);
}

const appBarThemeLight = AppBarTheme(
  color: AppColors.backgroundColorLight,
  centerTitle: true,
  titleTextStyle: TextStyle(
    color: Color.fromARGB(255, 15, 199, 70),
    fontSize: 30,
    fontWeight: FontWeight.w900,
    fontStyle: FontStyle.italic,
  ),
  iconTheme: IconThemeData(color: Colors.black),
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
  iconTheme: IconThemeData(color: Colors.white),
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
  // Für Container-Überschriften
  titleLarge: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColorLight,
  ),
  // Für normalen Text in Containern
  bodyMedium: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textColorLight,
  ),
);

const textThemeDark = TextTheme(
  // Für Container-Überschriften
  titleLarge: TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textColorDark,
  ),
  // Für normalen Text in Containern
  bodyMedium: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textColorDark,
  ),
);

const elevatedButtonThemeLight = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(AppColors.accentColor),
    foregroundColor: WidgetStatePropertyAll(AppColors.textColorLight),
    textStyle: WidgetStatePropertyAll(
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    ),
  ),
);

const elevatedButtonThemeDark = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(AppColors.accentColor),
    foregroundColor: WidgetStatePropertyAll(AppColors.textColorLight),
    textStyle: WidgetStatePropertyAll(
      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
    ),
    padding: WidgetStatePropertyAll(
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    ),
  ),
);

const cardThemeLight = CardTheme(
  color: AppColors.secondaryColorLight,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
  ),
);

const cardThemeDark = CardTheme(
  color: AppColors.secondaryColorDark,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
  ),
);

const listTileThemeLight = ListTileThemeData(
  titleTextStyle: TextStyle(color: AppColors.textColorDark, fontSize: 16.0),
  subtitleTextStyle:
      TextStyle(color: AppColors.primaryColorLight, fontSize: 14.0),
  iconColor: AppColors.textColorDark,
  contentPadding: EdgeInsets.only(left: 10.0),
);

const listTileThemeDark = ListTileThemeData(
  titleTextStyle: TextStyle(color: AppColors.textColorLight, fontSize: 16.0),
  subtitleTextStyle:
      TextStyle(color: AppColors.primaryColorDark, fontSize: 14.0),
  iconColor: AppColors.textColorLight,
  contentPadding: EdgeInsets.only(left: 10.0),
);

const floatingActionButtonThemeLight = FloatingActionButtonThemeData(
  backgroundColor: AppColors.accentColor,
);

const floatingActionButtonThemeDark = FloatingActionButtonThemeData(
  backgroundColor: AppColors.accentColor,
);

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto',
  fontFamilyFallback: const ['sans-serif'],
  primaryColor: AppColors.primaryColorLight,
  scaffoldBackgroundColor: AppColors.backgroundColorLight,
  appBarTheme: appBarThemeLight,
  bottomNavigationBarTheme: bottomNavigationBarThemeLight,
  textTheme: textThemeLight,
  elevatedButtonTheme: elevatedButtonThemeLight,
  listTileTheme: listTileThemeLight,
  cardTheme: cardThemeLight,
  iconTheme: const IconThemeData(color: Colors.black),
  floatingActionButtonTheme: floatingActionButtonThemeLight,
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Roboto',
  fontFamilyFallback: const ['sans-serif'],
  primaryColor: AppColors.primaryColorDark,
  scaffoldBackgroundColor: AppColors.backgroundColorDark,
  appBarTheme: appBarThemeDark,
  bottomNavigationBarTheme: bottomNavigationBarThemeDark,
  textTheme: textThemeDark,
  elevatedButtonTheme: elevatedButtonThemeDark,
  listTileTheme: listTileThemeDark,
  cardTheme: cardThemeDark,
  iconTheme: const IconThemeData(color: Colors.white),
  floatingActionButtonTheme: floatingActionButtonThemeDark,
);
