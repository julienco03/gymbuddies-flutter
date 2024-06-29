import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/calender/widgets/calendar_new_session_view.dart';

class CalendarNewSessionPage extends StatefulWidget {
  final DateTime day;
  const CalendarNewSessionPage({super.key, required this.day});

  @override
  CalendarNewSessionPageState createState() => CalendarNewSessionPageState();
}

class CalendarNewSessionPageState extends State<CalendarNewSessionPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CalendarNewSessionView(),
    );
  }
}
