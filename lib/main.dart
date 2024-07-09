import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gymbuddies/database/database_helper.dart';
import 'package:gymbuddies/presentation/contacts/pages/contact_detail_page.dart';

import 'theme_provider.dart';
import 'presentation/auth/pages/login_page.dart';
import 'presentation/auth/pages/signup_page.dart';
import 'presentation/calender/pages/calendar_detail_page.dart';
import 'presentation/calender/pages/calendar_page.dart';
import 'presentation/contacts/pages/contacts_page.dart';
import 'presentation/home/pages/home_page.dart';
import 'presentation/profile/pages/profile_page.dart';
import 'presentation/settings/pages/settings_page.dart';
import 'presentation/training/pages/ongoing_training_page.dart';
import 'presentation/training/pages/training_plans_page.dart';
import 'presentation/training/pages/start_training_page.dart';
import 'presentation/training/widgets/training_plan_detail_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final GoRouter _router = GoRouter(
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
      routes: [
        GoRoute(
          path: 'detail/:trainingSessionId',
          builder: (context, state) {
            final trainingSessionId =
                int.parse(state.pathParameters['trainingSessionId']!);
            return CalendarDetailPage(trainingSessionId: trainingSessionId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/contacts',
      builder: (context, state) => const ContactsPage(),
      routes: [
        GoRoute(
          path: 'detail/:contactId',
          builder: (context, state) {
            final contactId = int.parse(state.pathParameters['contactId']!);
            return ContactDetailPage(contactId: contactId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/training',
      builder: (context, state) => const TrainingPage(),
      routes: [
        GoRoute(
          path: 'start',
          builder: (context, state) => const TrainingStartPage(),
        ),
        GoRoute(
          path: 'ongoing-training',
          builder: (context, state) => const OngoingTrainingPage(),
        ),
        GoRoute(
          path: 'detail/:trainingPlanId',
          builder: (context, state) {
            final trainingPlanId =
                int.parse(state.pathParameters['trainingPlanId']!);
            return TrainingPlanDetailView(trainingPlanId: trainingPlanId);
          },
        ),
      ],
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dbHelper = DatabaseHelper();

  // Initialize the database
  await dbHelper.database;

  // Insert initial data if not already present
  await _initializeData(dbHelper);

  runApp(const ProviderScope(child: MyApp()));
}

Future<void> _initializeData(DatabaseHelper dbHelper) async {
  List<Map<String, dynamic>> existingUpcomingTrainings = await dbHelper.getUpcomingTrainings();
  List<Map<String, dynamic>> existingRecentTrainings = await dbHelper.getRecentTrainings();

  if (existingUpcomingTrainings.isEmpty) {
    List<Map<String, dynamic>> upcomingTrainings = [
      {'training': 'Biking with Tom', 'date': '2024-05-01', 'training_plan': 1, 'contact': 1},
      {'training': 'Chest Day with Harry', 'date': '2024-05-04', 'training_plan': 1, 'contact': 1},
      {'training': 'Hiking with Larry', 'date': '2024-05-05', 'training_plan': 1, 'contact': 1},
      {'training': 'Swimming with Mike', 'date': '2024-06-12', 'training_plan': 1, 'contact': 1},
      {'training': 'Chest with Luke', 'date': '2024-06-19', 'training_plan': 1, 'contact': 1},
    ];

    for (var training in upcomingTrainings) {
      await dbHelper.insertUpcomingTraining(
        training['training'] as String,
        training['date'] as String,
        training['training_plan'] as int,
        training['contact'] as int,
      );
    }
  }

  if (existingRecentTrainings.isEmpty) {
    List<String> recentTrainings = [
      '3 days ago | 1:30h | Biking',
      '5 days ago | 30min | Jogging',
      '15.04.2024 | 45min | Legs',
      '12.03.2024 | 2:00h | Swimming',
      '18.03.2024 | 2:30h | Biking'
    ];

    for (var training in recentTrainings) {
      await dbHelper.insertRecentTraining(training);
    }
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Gymbuddies',
      theme: theme,
    );
  }
}
