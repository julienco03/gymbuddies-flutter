import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/common/themes/app_theme.dart';

class RecentTrainingsWidget extends StatelessWidget {
  const RecentTrainingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    List<String> lastTrainingSessions = const [
      '3 Days ago | 2.10 Hours | Biking',
      '5 Days ago | 30 Minutes | Jogging',
      '15.04.2024 | 1 Hour | Legs',
      '15.04.2024 | 1 Hour | Legs'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Recent Trainings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
        const Padding(padding: EdgeInsetsDirectional.symmetric(vertical: 5.0)),
        Row(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              height: screenHeight * 0.25,
              width: screenWidth * 0.85,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                boxShadow: [
                  BoxShadow(color: Colors.black),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: lastTrainingSessions.map((String text) {
                  return Text(
                    text,
                    style: Theme.of(context).textTheme.bodyMedium,
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
