import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/calender/pages/calendar_page.dart';
import 'package:gymbuddies/presentation/contacts/pages/contacts_page.dart';
import 'package:gymbuddies/presentation/home/pages/home_page.dart';
import 'package:gymbuddies/presentation/training/pages/training_page.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({required this.currentIndex, super.key});

  final int currentIndex;

  void _navigateWithAnimation(BuildContext context, int index) {
    Widget page;
    if (index != currentIndex) {
      switch (index) {
        case 0:
          page = const HomePage();
          break;
        case 1:
          page = const TrainingPage();
          break;
        case 2:
          page = const CalendarPage();
          break;
        case 3:
          page = const ContactsPage();
          break;
        default:
          return;
      }

      Navigator.pushReplacement(
        context,
        PageRouteBuilder<Widget>(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) => _navigateWithAnimation(context, index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Training',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Calender',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts),
          label: 'Contacts',
        ),
      ],
    );
  }
}
