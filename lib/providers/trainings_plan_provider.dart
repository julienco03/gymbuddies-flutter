import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database_helper.dart';

final trainingPlansProvider = StateNotifierProvider<TrainingPlansNotifier, List<String>>((ref) {
  return TrainingPlansNotifier();
});

class TrainingPlansNotifier extends StateNotifier<List<String>> {
  TrainingPlansNotifier() : super([]);
  DatabaseHelper dbHelper = DatabaseHelper();

  Future<void> loadTrainingPlans() async {
    final plans = await dbHelper.getTrainingPlans();
    state = plans.map((plan) => plan['name'] as String).toList();
  }

  Future<void> addTrainingPlan(String name, String description) async {
    await dbHelper.insertTrainingPlan(name, description);
    await loadTrainingPlans();
  }
}
