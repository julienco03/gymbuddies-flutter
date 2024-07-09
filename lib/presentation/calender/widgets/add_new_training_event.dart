import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/providers/calender_provider.dart';

class AddNewTrainingEventWidget extends ConsumerStatefulWidget {
  const AddNewTrainingEventWidget({super.key});

  @override
  _AddNewTrainingEventWidgetState createState() => _AddNewTrainingEventWidgetState();
}

class _AddNewTrainingEventWidgetState extends ConsumerState<AddNewTrainingEventWidget> {
  final TextEditingController eventController = TextEditingController();
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _addEvent() {
    if (selectedDate != null && eventController.text.isNotEmpty) {
      final event = '${selectedDate!.toLocal()} | ${eventController.text}';
      ref.read(calendarEventsProvider.notifier).addEvent(event);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await _selectDate(context);
        if (selectedDate != null) {
          _addEvent();
        }
      },
      child: const Icon(Icons.add),
    );
  }
}