import 'package:flutter/material.dart';
import 'package:gymbuddies/database/database_helper.dart';

class CalendarDetailView extends StatefulWidget {
  final int trainingSessionId;
  final DateTime date;
  final String contact;
  final String trainingPlan;

  const CalendarDetailView({
    super.key,
    required this.trainingSessionId,
    required this.date,
    required this.contact,
    required this.trainingPlan,
  });

  @override
  _CalendarDetailViewState createState() => _CalendarDetailViewState();
}

class _CalendarDetailViewState extends State<CalendarDetailView> {
  late Future<Map<String, dynamic>?> _trainingPlanDetails;

  @override
  void initState() {
    super.initState();
    _trainingPlanDetails = _getTrainingPlanDetails(widget.trainingSessionId);
  }

  Future<Map<String, dynamic>?> _getTrainingPlanDetails(int id) async {
    final trainingPlans = await DatabaseHelper().getUpcomingTrainings();
    final trainingPlan = trainingPlans.firstWhere(
      (plan) => plan['id'] == id, 
      orElse: () => {}
    );
    print('Fetched Training Plan: $trainingPlan');
    return trainingPlan;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Training Event'),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _trainingPlanDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('Training event not found'));
          }

          final trainingPlan = snapshot.data!;
          final training = trainingPlan['training'] ?? '';
          final trainingPlanName = trainingPlan['training_plan'] ?? '';
          final contact = trainingPlan['contact'] ?? '';
          final date = trainingPlan['date'] ?? '';

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Training: $training', style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 8),
                Text('Training Plan: $trainingPlanName', style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 8),
                Text('Contact: $contact', style: const TextStyle(color: Colors.white)),
                const SizedBox(height: 8),
                Text('Date: $date', style: const TextStyle(color: Colors.white)),
              ],
            ),
          );
        },
      ),
    );
  }
}
