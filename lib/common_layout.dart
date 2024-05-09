import 'package:flutter/material.dart';
import 'package:gymbuddies/colors.dart';
import 'package:gymbuddies/pages/profile.dart';
import 'package:gymbuddies/pages/settings.dart';
import 'package:gymbuddies/pages/home.dart';
import 'package:gymbuddies/pages/training.dart';
import 'package:gymbuddies/pages/calender.dart';
import 'package:gymbuddies/pages/contacts.dart';

class CommonLayout extends StatelessWidget {
  final Widget body;
  final int selectedIndex;

  const CommonLayout({
    super.key,
    required this.body,
    required this.selectedIndex,
  });

  void _navigateWithAnimation(BuildContext context, int index) {
    Widget page;
    if (index != selectedIndex) {
      switch (index) {
        case 0:
          page = const HomePage();
          break;
        case 1:
          page = const TrainingPage();
          break;
        case 2:
          page = const CalenderPage();
          break;
        case 3:
          page = const ContactsPage();
          break;
        default:
          return;
      }

      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
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
    Brightness platformBrightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gymbuddies",
          style: TextStyle(
            color: AppColors.getTextColor(isDarkMode),
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: AppColors.getSecondaryColor(isDarkMode),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.getAccentColor(isDarkMode)),
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingsPage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
        ],
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.getSecondaryColor(isDarkMode),
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
        currentIndex: selectedIndex,
        fixedColor: AppColors.getAccentColor(isDarkMode),
        unselectedItemColor: AppColors.getTextColor(isDarkMode),
        onTap: (index) => _navigateWithAnimation(context, index),
      ),
    );
  }
}
