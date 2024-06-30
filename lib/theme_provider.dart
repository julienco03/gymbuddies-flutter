import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/common/themes/app_theme.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(darkTheme);
  void toggleTheme(bool isDarkMode) {
    if (isDarkMode) {
      state = darkTheme;
    } else {
      state = lightTheme;
    }
  }
}
