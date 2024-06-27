import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/presentation/settings/pages/settings_page.dart';

void main() {
  testWidgets('Dark mode toggle test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SettingsPage(),
        ),
      ),
    );

    final switchFinder = find.byType(Switch);
    expect(switchFinder, findsOneWidget);
    Switch darkModeSwitch = tester.widget(switchFinder);
    expect(darkModeSwitch.value, isFalse);

    await tester.tap(switchFinder);
    await tester.pumpAndSettle();

    darkModeSwitch = tester.widget(switchFinder);
    expect(darkModeSwitch.value, isTrue);
  });
}
