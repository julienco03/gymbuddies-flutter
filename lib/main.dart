import 'package:flutter/material.dart';

import 'presentation/auth/pages/login_page.dart';
import 'presentation/auth/pages/signup_page.dart';
import 'presentation/calender/pages/calendar_page.dart';
import 'presentation/common/themes/app_theme.dart';
import 'presentation/contacts/pages/contacts_page.dart';
import 'presentation/home/pages/home_page.dart';
import 'presentation/profile/pages/profile_page.dart';
import 'presentation/settings/pages/settings_page.dart';
import 'presentation/training/pages/training_page.dart';
import 'presentation/training/pages/training_start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gymbuddies',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/signup': (context) => const SignupPage(),
        '/login': (context) => const LoginPage(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),
        '/calendar': (context) => const CalendarPage(),
        '/contacts': (context) => const ContactsPage(),
        '/training': (context) => const TrainingPage(),
        '/training/start': (context) => const TrainingStartPage(),
      },
    );
  }
}
