import 'package:flutter/material.dart';
import 'package:gymbuddies/pages/profile.dart';
import 'package:gymbuddies/pages/settings.dart';

class CommonLayout extends StatelessWidget {
  final Widget body;
  final int selectedIndex;

  const CommonLayout({
    super.key,
    required this.body,
    required this.selectedIndex,
  });

  void _onItemTapped(BuildContext context, int index) {
    // Navigation zur entsprechenden Seite durchführen
    if (index != selectedIndex) {
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/home');
          break;
        case 1:
          Navigator.pushReplacementNamed(context, '/training');
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/calender');
          break;
        case 3:
          Navigator.pushReplacementNamed(context, '/contacts');
          break;
        // TODO: Fehlerbehandlung?
        // TODO: schönere Animation für Seitenwechsel
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gymbuddies",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 30,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
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
        backgroundColor: Colors.blue[800],
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
        fixedColor: Colors.amber[400],
        unselectedItemColor: Colors.white,
        onTap: (index) => _onItemTapped(context, index),
      ),
    );
  }
}
