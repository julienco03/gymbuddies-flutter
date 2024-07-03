import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/presentation/calender/utils/calendar_utils.dart';
import 'package:gymbuddies/presentation/calender/widgets/calendar_view.dart';
import 'package:gymbuddies/presentation/common/widgets/app_bar.dart';
import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';
import 'package:gymbuddies/database/database_helper.dart';
import 'package:gymbuddies/providers/upcoming_trainings_provider.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/add_training_event_dialog.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<State<EventCalenderWidget>> _calendarKey = GlobalKey<State<EventCalenderWidget>>();
  Map<DateTime, List<Event>> _events = {};

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    final dbHelper = DatabaseHelper();
    final upcomingTrainings = await dbHelper.getUpcomingTrainings();
    setState(() {
      _events = LinkedHashMap<DateTime, List<Event>>(
        equals: isSameDay,
        hashCode: getHashCode,
      );
      for (var training in upcomingTrainings) {
        final date = training['date'] as DateTime;
        final id = training['id'] as int;
        final event = Event(id, '${training['training']}');
        if (_events[date] != null) {
          _events[date]!.add(event);
        } else {
          _events[date] = [event];
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final upcomingTrainings = ref.watch(upcomingTrainingsProvider);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: EventCalenderWidget(
                key: _calendarKey,
                events: _events,
              
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 4000,
              ),
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: upcomingTrainings.length,
                itemBuilder: (context, index) {
                  final training = upcomingTrainings[index];
                  return ListTile(
                    title: Text(training['training' as int]),
                    subtitle: Text('On ${training['date' as int]}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () async {
                        await DatabaseHelper().deleteUpcomingTraining(training['id' as int] as int);
                        _loadEvents();
                        ref.refresh(upcomingTrainingsProvider);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTrainingDialog(context, ref),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 2),
    );
  }

  void _showAddTrainingDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AddTrainingEventDialog(onAdd: (training, date, trainingPlan, contact) async {
          await DatabaseHelper().insertUpcomingTraining(training, date, trainingPlan, contact);
          await _loadEvents();
          ref.refresh(upcomingTrainingsProvider);
        });
      },
    );
  }
}
