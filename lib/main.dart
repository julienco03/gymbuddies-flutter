import 'package:flutter/material.dart';
import 'package:gymbuddies/pages/home.dart';
import 'package:gymbuddies/pages/training.dart';
import 'package:gymbuddies/pages/calender.dart';
import 'package:gymbuddies/pages/contacts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gymbuddies",
      theme: ThemeData(fontFamily: "Roboto"),
      home: const HomePage(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/training': (context) => const TrainingPage(),
        '/calender': (context) => const CalenderPage(),
        '/contacts': (context) => const ContactsPage(),
      },
    );
  }
}
