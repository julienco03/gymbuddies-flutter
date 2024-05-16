import 'package:flutter/material.dart';
import 'package:gymbuddies/common_layout.dart';
import 'package:gymbuddies/components/container_with_text_and_buttons.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: TrainingPageBody(),
      selectedIndex: 1,
    );
  }
}

class TrainingPageBody extends StatelessWidget {
  const TrainingPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = platformBrightness == Brightness.dark;

    List<String> trainingPlans = const [
      "Biking Tour  |  2h",
      "Chest Training  |  1h 30min",
      "Back Workout  |  50min",
      "Leg Day incl. Cardio  |  45min",
    ];

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(padding: EdgeInsets.only(top: 30.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContainerWithTextAndButtons(
                  heading: "Training plans",
                  containerText: trainingPlans,
                  darkMode: isDarkMode)
            ],
          )
        ]);
  }
}
