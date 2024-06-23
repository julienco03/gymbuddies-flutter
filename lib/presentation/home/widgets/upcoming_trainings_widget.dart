import 'package:flutter/material.dart';

class UpcomingTrainingsWidget extends StatelessWidget {
  const UpcomingTrainingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    List<String> upcomingTrainingSessions = const [
      'In 1 Day: Biking with Tom',
      'In 4 Days: Chest Day with Harry',
      'On 05 May: Hiking with Larry',
      'On 12 June: Swimming with Mike'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('Upcoming', style: Theme.of(context).textTheme.titleLarge),
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
                children: upcomingTrainingSessions.map((String text) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
