import 'package:flutter/material.dart';

class RecentTrainingsWidget extends StatelessWidget {
  const RecentTrainingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    List<String> lastTrainingSessions = const [
      '3 days ago | 1:30h | Biking',
      '5 days ago | 30min | Jogging',
      '15.04.2024 | 45min | Legs',
      '12.03.2024 | 2:00h | Swimming'
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
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              height: screenHeight * 0.25,
              width: screenWidth * 0.85,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: const [
                  BoxShadow(color: Colors.black),
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
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
