import 'package:flutter/material.dart';

class AddNewTrainingEventWidget extends StatelessWidget {
  const AddNewTrainingEventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
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
    );
  }
}
