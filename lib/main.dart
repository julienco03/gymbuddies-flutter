import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'presentation/auth/pages/login_page.dart';
import 'presentation/auth/pages/signup_page.dart';
import 'presentation/calender/pages/calendar_page.dart';
import 'presentation/common/themes/app_theme.dart';
import 'presentation/contacts/pages/contacts_page.dart';
import 'presentation/home/pages/home_page.dart';
import 'presentation/profile/pages/profile_page.dart';
import 'presentation/settings/pages/settings_page.dart';
import 'presentation/training/pages/ongoing_training_page.dart';
import 'presentation/training/pages/training_plans_page.dart';
import 'presentation/training/pages/start_training_page.dart';
import 'presentation/training/widgets/training_plan_detail_view.dart';

final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: '/calendar',
      builder: (context, state) => const CalendarPage(),
    ),
    GoRoute(
      path: '/contacts',
      builder: (context, state) => const ContactsPage(),
    ),
    GoRoute(
      path: '/training',
      builder: (context, state) => const TrainingPage(),
    ),
    GoRoute(
      path: '/training/start',
      builder: (context, state) => const TrainingStartPage(),
    ),
    GoRoute(
      path: '/training/ongoing-training',
      builder: (context, state) => const OngoingTrainingPage(),
    ),
    GoRoute(
      path: '/training/detail/:trainingPlanId',
      builder: (context, state) {
        final trainingPlanId =
            int.parse(state.pathParameters['trainingPlanId']!);
        return TrainingPlanDetailView(trainingPlanId: trainingPlanId);
      },
    ),
  ],
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Gymbuddies',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
