import 'package:flutter_riverpod/flutter_riverpod.dart';

final calendarEventsProvider = StateNotifierProvider<CalendarEventsNotifier, List<String>>((ref) {
  return CalendarEventsNotifier();
});

class CalendarEventsNotifier extends StateNotifier<List<String>> {
  CalendarEventsNotifier() : super([]);

  void addEvent(String event) {
    state = [...state, event];
  }
  void removeEvent(String training) {
    state = state.where((t) => t != training).toList();
  }
}