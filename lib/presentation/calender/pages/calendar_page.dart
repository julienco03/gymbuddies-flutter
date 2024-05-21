import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/calender/widgets/calendar_view.dart';
import 'package:gymbuddies/presentation/common/widgets/app_bar.dart';
import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: Stack(children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 80.0),
          child: EventCalenderWidget(),
        ),
        Positioned(
          bottom: 17.0,
          right: 17.0,
          child: FloatingActionButton(
            onPressed: () {
              // TODO: Bei Klick auf den Plus-Button soll sich eine neue View über der CalenderPage öffnen,
              // mit der man einen neuen Trainingstermin hinzufügen kann
              // Das Datum holt man sich hierbei über den ausgewählten Tag
              // Der neue Termin wird schließlich in der Datenbank gespeichert
            },
            child: const Icon(Icons.add), // Hintergrundfarbe des FABs
          ),
        ),
      ]),
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: _currentIndex),
    );
  }
}
