import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/calender/widgets/calendar_detail_view.dart';

class CalendarDetailPage extends StatefulWidget {
  final int trainingSessionId;
  const CalendarDetailPage({super.key, required this.trainingSessionId});

  @override
  CalendarDetailPageState createState() => CalendarDetailPageState();
}

class CalendarDetailPageState extends State<CalendarDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CalendarDetailView(trainingSessionId: widget.trainingSessionId, date: DateTime.now(), contact: '', trainingPlan: '',),
    );
  }
}
