import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database_helper.dart';

final upcomingTrainingProvider = FutureProvider<List<String>>((ref) async {
  final dbHelper = DatabaseHelper();
  return await dbHelper.getTrainings('upcoming_trainings');
});

final recentTrainingProvider = FutureProvider<List<String>>((ref) async {
  final dbHelper = DatabaseHelper();
  return await dbHelper.getTrainings('recent_trainings');
});
