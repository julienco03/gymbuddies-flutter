import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../common_layout.dart';
import '../components/container_with_text.dart';
import '../pages/training.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: HomePageBody(),
      selectedIndex: 0,
    );
  }
}

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = platformBrightness == Brightness.dark;

    List<String> upcomingTrainingSessions = const [
      "In 1 Day: Biking with Tom",
      "In 4 Days: Chest Day with Harry",
      "On 05 May: Hiking with Larry",
      "On 12 June: Swimming with Mike"
    ];

    List<String> lastTrainingSessions = const [
      "3 Days ago | 2.10 Hours | Biking",
      "5 Days ago | 30 Minutes | Jogging",
      "15.04.2024 | 1 Hour | Legs",
      "15.04.2024 | 1 Hour | Legs"
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerWithText(
              heading: 'Upcoming',
              containerText: upcomingTrainingSessions,
              darkMode: isDarkMode,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerWithText(
              heading: 'Last Trainings',
              containerText: lastTrainingSessions,
              darkMode: isDarkMode,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const TrainingPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 200),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  side: BorderSide(
                      color: AppColors.getAccentColor(isDarkMode), width: 3),
                  elevation: 5,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0)),
              child: Text(
                "START TRAINING",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.getSecondaryColor(isDarkMode)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
