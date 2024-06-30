import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final counterProvider = StateProvider<int>((ref) => 0);


final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(ThemeData.light());
  void toggleTheme(bool isDarkMode) {
    if (isDarkMode) {
      state = ThemeData.dark();
    } else {
      state = ThemeData.light();
    }
  }
}
