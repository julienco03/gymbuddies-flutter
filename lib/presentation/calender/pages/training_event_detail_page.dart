import 'package:flutter/material.dart';
import 'package:gymbuddies/database/database_helper.dart';
import 'package:gymbuddies/presentation/common/themes/app_theme.dart';

class TrainingEventDetailPage extends StatelessWidget {
  final int eventId;

  const TrainingEventDetailPage({super.key, required this.eventId});

  Future<List<Map<String, dynamic>>> _fetchEventDetails() async {
    final dbHelper = DatabaseHelper();
    final event = await dbHelper.getUpcomingTrainings();
    return event;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchEventDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          } else {
            final event = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Training: ${event['training' as int]}', style: TextStyle(color: Theme.of(context).primaryColor)),
                  const SizedBox(height: 8.0),
                  Text('Date: ${event['date' as int]}', style: TextStyle(color: Theme.of(context).primaryColor)),
                  const SizedBox(height: 8.0),
                  Text('Training Plan ID: ${event['training_plan_id' as int]}', style: TextStyle(color: Theme.of(context).primaryColor)),
                  const SizedBox(height: 8.0),
                  Text('Contact ID: ${event['contact_id' as int]}', style: TextStyle(color: Theme.of(context).primaryColor)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
