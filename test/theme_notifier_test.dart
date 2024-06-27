import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/counter_provider.dart';

void main() {
  group('ThemeNotifier', () {
    test('toggles theme from light to dark', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final themeNotifier = container.read(themeProvider.notifier);

      expect(container.read(themeProvider), ThemeData.light());

      themeNotifier.toggleTheme(true);

      expect(container.read(themeProvider), ThemeData.dark());
    });

    test('toggles theme from dark to light', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final themeNotifier = container.read(themeProvider.notifier);

      themeNotifier.toggleTheme(true); // Set dark mode first
      expect(container.read(themeProvider), ThemeData.dark());

      themeNotifier.toggleTheme(false);

      expect(container.read(themeProvider), ThemeData.light());
    });
  });
}
