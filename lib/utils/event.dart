import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

// TODO: Die Klasse Event soll evtl. in TrainingSession umbenannt werden
// und um die Uhrzeit erweitert werden

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
  // TODO: Hole Trainingstermine aus Datenbank
  kToday: [
    const Event('Chest Day with Tom'),
    const Event('Biking with Max'),
    const Event('Abs workout'),
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
