import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

class Event {
  final int id;
  final String title;

  const Event(this.id, this.title);

  @override
  String toString() => title;
}

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
