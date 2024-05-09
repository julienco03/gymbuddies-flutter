import 'package:flutter/material.dart';

class AppColors {
  static const Color _primaryColor = Color(0xFFECECEC);
  static const Color _primaryColorDark = Color(0xFFECECEC);

  static const Color _secondaryColor = Color(0xFF1976D2);
  static const Color _secondaryColorDark = Color(0xFF211D50);

  static const Color _accentColor = Color(0xFFFFC107);
  static const Color _accentColorDark = Color(0xFF00E890);

  static const Color _backgroundColor = Color(0xFFFFFFFF);
  static const Color _backgroundColorDark = Color(0xFF121212);

  static const Color _textColor = Color(0xFFFFFFFF);
  static const Color _textColorDark = Color(0xFF212121);

  static const Color _shadowColor = Color(0x33000000);
  static const Color _shadowColorDark = Color(0x33000000);

  static Color getPrimaryColor(bool isDarkMode) {
    return isDarkMode ? _primaryColorDark : _primaryColor;
  }

  static Color getSecondaryColor(bool isDarkMode) {
    return isDarkMode ? _secondaryColorDark : _secondaryColor;
  }

  static Color getAccentColor(bool isDarkMode) {
    return isDarkMode ? _accentColorDark : _accentColor;
  }

  static Color getBackgroundColor(bool isDarkMode) {
    return isDarkMode ? _backgroundColorDark : _backgroundColor;
  }

  static Color getTextColor(bool isDarkMode) {
    return isDarkMode ? _textColorDark : _textColor;
  }

  static Color getShadowColor(bool isDarkMode) {
    return isDarkMode ? _shadowColorDark : _shadowColor;
  }
}
