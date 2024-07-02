import 'package:flutter/material.dart';

class AddTrainingEventDialog extends StatefulWidget {
  final void Function(String training, String date) onAdd;

  const AddTrainingEventDialog({required this.onAdd, super.key});

  @override
  _AddTrainingEventDialogState createState() => _AddTrainingEventDialogState();
}

class _AddTrainingEventDialogState extends State<AddTrainingEventDialog> {
  final TextEditingController _trainingController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Training Event'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _trainingController,
            decoration: const InputDecoration(labelText: 'Training'),
          ),
          const SizedBox(height: 20),
          Text('Selected date: ${_selectedDate.toLocal()}'.split(' ')[0]),
          ElevatedButton(
            onPressed: _selectDate,
            child: const Text('Select date'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            widget.onAdd(_trainingController.text, _selectedDate.toString().split(' ')[0]);
            Navigator.of(context).pop();
          },
          child: const Text('Add', style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }
}
