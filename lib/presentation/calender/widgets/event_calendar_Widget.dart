import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gymbuddies/presentation/calender/utils/calendar_utils.dart';

class EventCalendarWidget extends StatelessWidget {
  final Map<DateTime, List<Event>> events;

  const EventCalendarWidget({super.key, required this.events});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Calendar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: events.keys.map((date) {
                  return ExpansionTile(
                    title: Text(DateTime(date as int) as String),
                    children: events[date]!.map((event) {
                      return ListTile(
                        title: Text(event.title),
                        onTap: () {
                          context.go('/calendar/detail/${event.id}');
                        },
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
