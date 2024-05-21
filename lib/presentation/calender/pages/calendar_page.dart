import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/calender/widgets/add_new_training_event_button.dart';
import 'package:gymbuddies/presentation/calender/widgets/calendar_view.dart';
import 'package:gymbuddies/presentation/common/widgets/app_bar.dart';
import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: const Stack(children: [
        Padding(
          padding: EdgeInsets.only(bottom: 80.0),
          child: EventCalenderWidget(),
        ),
        AddNewTrainingEventWidget(),
      ]),
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: _currentIndex),
    );
  }
}
