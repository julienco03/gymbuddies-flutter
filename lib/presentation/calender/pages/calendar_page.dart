import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/contact_provider.dart';
import 'package:gymbuddies/presentation/calender/widgets/add_new_training_event_button.dart';
import 'package:gymbuddies/presentation/calender/widgets/calendar_view.dart';
import 'package:gymbuddies/presentation/common/widgets/app_bar.dart';
import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends ConsumerState<CalendarPage> {
  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    final contactsAsyncValue = ref.watch(contactsProvider);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: const Padding(
        padding: EdgeInsets.only(bottom: 100.0),
        child: EventCalenderWidget(),
      ),
      floatingActionButton: AddNewTrainingEventWidget(
        contactsProvider: contactsProvider,
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: _currentIndex),
    );
  }
}
