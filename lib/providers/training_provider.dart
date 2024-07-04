import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/database/database_helper.dart';

final upcomingTrainingProvider = StateNotifierProvider<UpcomingTrainingNotifier, AsyncValue<List<String>>>((ref) {
  return UpcomingTrainingNotifier();
});

final recentTrainingProvider = FutureProvider<List<String>>((ref) async {
  final dbHelper = DatabaseHelper();
  return await dbHelper.getTrainings('recent_trainings');
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
