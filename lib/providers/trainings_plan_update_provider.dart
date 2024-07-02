import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/database/database_helper.dart';

// Define a provider for the training plans
final trainingPlanUpdateProvider = FutureProvider.autoDispose<List<Map<String, dynamic>>>((ref) async {
  return DatabaseHelper().getTrainingPlans();
});
