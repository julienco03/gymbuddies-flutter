import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {
  kToday: [
    const Event('Chest Day with Tom | 9am'),
    const Event('Biking with Max | 4:30pm'),
    const Event('Swimming with Bob | 7:10pm'),
    const Event('Meditation | 11pm'),
    const Event('Sleeping | 12pm'),
  ],
};

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

const int _visibleMonths = 3;

final kToday = DateTime.now();
final kFirstDay =
    DateTime(kToday.year, kToday.month - _visibleMonths, kToday.day);
final kLastDay =
    DateTime(kToday.year, kToday.month + _visibleMonths, kToday.day);
const locale = 'en_US';
