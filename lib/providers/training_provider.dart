import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/database/database_helper.dart';

final upcomingTrainingProvider = StateNotifierProvider<UpcomingTrainingNotifier, AsyncValue<List<String>>>((ref) {
  return UpcomingTrainingNotifier();
});

class UpcomingTrainingNotifier extends StateNotifier<AsyncValue<List<String>>> {
  UpcomingTrainingNotifier() : super(const AsyncValue.loading()) {
    fetchUpcomingTrainings();
  }

  Future<void> fetchUpcomingTrainings() async {
    try {
      final upcomingTrainings = await DatabaseHelper().getUpcomingTrainings();
      state = AsyncValue.data(upcomingTrainings.map((training) => training['training'] as String).toList());
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.empty);
    }
  }

  void refresh() {
    fetchUpcomingTrainings();
  }
}
