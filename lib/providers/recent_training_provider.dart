import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/database/database_helper.dart';

final recentTrainingProvider = StateNotifierProvider<RecentTrainingNotifier, AsyncValue<List<String>>>((ref) {
  return RecentTrainingNotifier();
});

class RecentTrainingNotifier extends StateNotifier<AsyncValue<List<String>>> {
  RecentTrainingNotifier() : super(const AsyncValue.loading()) {
    fetchRecentTrainings();
  }

  Future<void> fetchRecentTrainings() async {
    try {
      final recentTrainings = await DatabaseHelper().getRecentTraining();
      final trainingNames = recentTrainings.map((training) => training['training']).toList();
      state = AsyncValue.data(trainingNames.cast<String>());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.empty);
    }
  }

  void refresh() {
    fetchRecentTrainings();
  }
}
