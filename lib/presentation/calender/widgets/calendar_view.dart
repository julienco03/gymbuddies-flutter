import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gymbuddies/presentation/calender/utils/calendar_utils.dart';
import 'package:gymbuddies/presentation/common/themes/app_theme.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:gymbuddies/database/database_helper.dart';

class EventCalenderWidget extends StatefulWidget {
  final Map<DateTime, List<Event>> events;
  const EventCalenderWidget({required super.key, required this.events});

  @override
  State<EventCalenderWidget> createState() => _EventCalenderWidgetState();
}

class _EventCalenderWidgetState extends State<EventCalenderWidget> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return widget.events[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  Future<void> _deleteEvent(int eventId, DateTime eventDate) async {
    await DatabaseHelper().deleteUpcomingTraining(eventId);
    setState(() {
      widget.events[eventDate]?.removeWhere((event) => event.id == eventId);
      _selectedEvents.value = _getEventsForDay(_selectedDay!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar<Event>(
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: _calendarFormat,
          eventLoader: _getEventsForDay,
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: CalendarStyle(
            outsideDaysVisible: true,
            markerDecoration: BoxDecoration(
              color: Theme.of(context).iconTheme.color,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: const TextStyle(color: Colors.black),
            selectedDecoration: const BoxDecoration(
              color: AppColors.accentColor,
              shape: BoxShape.circle,
            ),
            todayTextStyle: const TextStyle(color: Colors.black),
            todayDecoration: BoxDecoration(
              color: AppColors.accentColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            defaultTextStyle: TextStyle(
              color: Theme.of(context).iconTheme.color,
            ),
            weekendTextStyle: TextStyle(
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          onDaySelected: _onDaySelected,
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        const SizedBox(height: 10.0),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Scrollbar(
              child: ValueListenableBuilder<List<Event>>(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      final event = value[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, right: 8.0),
                        child: Card(
                          child: ListTile(
                            title: Text('${value[index]}'),
                            trailing: IconButton(
                              iconSize: 28.0,
                              icon: const Icon(Icons.delete),
                              padding: const EdgeInsets.only(right: 10.0),
                              onPressed: () => _deleteEvent(event.id, _selectedDay!),
                            ),
                            onTap: () {
                              context.push('/calendar/detail/$index');
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
