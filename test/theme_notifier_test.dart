import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gymbuddies/presentation/common/themes/app_theme.dart';
import 'package:gymbuddies/theme_provider.dart';

void main() {
  group('ThemeNotifier', () {
    test('toggles theme from light to dark', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final themeNotifier = container.read(themeProvider.notifier);

      themeNotifier.toggleTheme(false);
      expect(container.read(themeProvider), lightTheme);

      themeNotifier.toggleTheme(true);

      expect(container.read(themeProvider), darkTheme);
    });

    test('toggles theme from dark to light', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final themeNotifier = container.read(themeProvider.notifier);

      themeNotifier.toggleTheme(true);
      expect(container.read(themeProvider), darkTheme);

      themeNotifier.toggleTheme(false);

      expect(container.read(themeProvider), lightTheme);
    });
  });
}
