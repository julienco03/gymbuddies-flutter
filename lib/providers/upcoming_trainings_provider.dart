import 'package:flutter_riverpod/flutter_riverpod.dart';

final upcomingTrainingsProvider = StateNotifierProvider<UpcomingTrainingsNotifier, List<String>>((ref) {
  return UpcomingTrainingsNotifier();
});

class UpcomingTrainingsNotifier extends StateNotifier<List<String>> {
  UpcomingTrainingsNotifier() : super([]);

  void addTraining(String training) {
    state = [...state, training];
  }

  void removeTraining(String training) {
    state = state.where((t) => t != training).toList();
  }
}
