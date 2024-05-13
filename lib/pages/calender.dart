import 'package:flutter/material.dart';
import 'package:gymbuddies/common_layout.dart';
import 'package:gymbuddies/components/event_calender.dart';

import '../utils/colors.dart';

class CalenderPage extends StatelessWidget {
  const CalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: CalenderPageBody(),
      selectedIndex: 2,
    );
  }
}

class CalenderPageBody extends StatelessWidget {
  const CalenderPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = platformBrightness == Brightness.dark;

    return Stack(children: [
      const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: SingleChildScrollView(
              child: SizedBox(
                height: 600.0,
                child: EventCalender(),
              ),
            ),
          ),
        ],
      ),
      Positioned(
        bottom: 16.0,
        right: 16.0,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.getAccentColor(isDarkMode),
          child: const Icon(Icons.add), // Hintergrundfarbe des FABs
        ),
      ),
    ]);
  }
}
