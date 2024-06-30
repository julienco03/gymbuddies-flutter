import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarNewSessionView extends StatelessWidget {
  const CalendarNewSessionView({super.key});

  @override
  Widget build(BuildContext context) {
    final String? day = GoRouterState.of(context).pathParameters['day'];
    final DateTime? selectedDay = DateTime.tryParse(day ?? '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Neuen Trainingstermin hinzufügen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selectedDay != null)
              Text(
                'Ausgewähltes Datum: ${selectedDay.toLocal().toIso8601String().split('T').first}',
                // style: Theme.of(context).textTheme.headline6,
              ),
            const SizedBox(height: 20),
            // Hier kannst du das Formular oder weitere Widgets hinzufügen
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Training Titel',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle adding new training event
              },
              child: const Text('Hinzufügen'),
            ),
          ],
        ),
      ),
    );
  }
}
