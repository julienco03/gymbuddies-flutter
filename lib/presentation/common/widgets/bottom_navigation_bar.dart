import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({required this.currentIndex, super.key});

  final int currentIndex;

  void _navigateWithAnimation(BuildContext context, int index) {
    if (index != currentIndex) {
      switch (index) {
        case 0:
          context.go('/home');
          break;
        case 1:
          context.go('/training');
          break;
        case 2:
          context.go('/calendar');
          break;
        case 3:
          context.go('/contacts');
          break;
        default:
          return;
      }
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
