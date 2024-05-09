import 'package:flutter/material.dart';
import 'package:gymbuddies/colors.dart';
import 'package:gymbuddies/common_layout.dart';
import 'package:gymbuddies/pages/training.dart';

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

class ContainerWithHeading extends StatelessWidget {
  final String heading;
  final List<String> containerText;
  final bool darkMode;

  const ContainerWithHeading({
    required this.heading,
    required this.containerText,
    required this.darkMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              heading,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.getSecondaryColor(darkMode),
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.getAccentColor(darkMode)),
            ),
          ],
        ),
        const Padding(padding: EdgeInsetsDirectional.symmetric(vertical: 5.0)),
        Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              height: MediaQuery.of(context).size.width * 0.45,
              width: MediaQuery.of(context).size.width * 0.87,
              decoration: BoxDecoration(
                color: AppColors.getSecondaryColor(darkMode),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.getShadowColor(darkMode),
                      spreadRadius: 3,
                      blurRadius: 3),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: containerText.map((String text) {
                  return Text(
                    text,
                    style: TextStyle(color: AppColors.getTextColor(darkMode)),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
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
            ContainerWithHeading(
              heading: 'Upcoming',
              containerText: upcomingTrainingSessions,
              darkMode: isDarkMode,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContainerWithHeading(
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
