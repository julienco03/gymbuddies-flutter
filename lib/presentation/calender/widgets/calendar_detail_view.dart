import 'package:flutter/material.dart';

class CalendarDetailView extends StatelessWidget {
  final int trainingSessionId;
  const CalendarDetailView({super.key, required this.trainingSessionId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training Session ID: $trainingSessionId'),
      ),
      body: null,
    );
  }
}
