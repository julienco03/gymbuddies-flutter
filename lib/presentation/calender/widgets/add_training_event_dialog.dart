import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/database/database_helper.dart';

class AddTrainingEventDialog extends ConsumerStatefulWidget {
  final Function(String training, String date, int? trainingPlanId, int? contactId) onAdd;

  const AddTrainingEventDialog({required this.onAdd, super.key});

  @override
  _AddTrainingEventDialogState createState() => _AddTrainingEventDialogState();
}

class _AddTrainingEventDialogState extends ConsumerState<AddTrainingEventDialog> {
  final TextEditingController _trainingController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  int? _selectedTrainingPlanId;
  int? _selectedContactId;

  List<Map<String, dynamic>> _trainingPlans = [];
  List<Map<String, dynamic>> _contacts = [];

  @override
  void initState() {
    super.initState();
    _fetchTrainingPlansAndContacts();
  }

  Future<void> _fetchTrainingPlansAndContacts() async {
    final dbHelper = DatabaseHelper();

    final trainingPlans = await dbHelper.getTrainingPlans();
    final contacts = await dbHelper.getContacts();

    setState(() {
      _trainingPlans = trainingPlans;
      _contacts = contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Training Event'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: _trainingController,
              decoration: const InputDecoration(labelText: 'Training'),
            ),
            Text('Selected date: ${_selectedDate.toLocal()}'.split(' ')[0]),
            ElevatedButton(
              onPressed: _selectDate,
              child: const Text('Select date'),
            ),
            DropdownButton<int>(
              value: _selectedTrainingPlanId,
              hint: const Text('Select Training Plan'),
              onChanged: (int? newValue) {
                setState(() {
                  _selectedTrainingPlanId = newValue;
                });
              },
              items: _trainingPlans.map<DropdownMenuItem<int>>((plan) {
                return DropdownMenuItem<int>(
                  value: plan['id'] as int,
                  child: Text(plan['name'].toString()),
                );
              }).toList(),
            ),
            DropdownButton<int>(
              value: _selectedContactId,
              hint: const Text('Select Contact'),
              onChanged: (int? newValue) {
                setState(() {
                  _selectedContactId = newValue;
                });
              },
              items: _contacts.map<DropdownMenuItem<int>>((contact) {
                return DropdownMenuItem<int>(
                  value: contact['id'] as int,
                  child: Text(contact['name'].toString()),
                );
              }).toList(),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel', style: TextStyle(color: Colors.green)),
        ),
        TextButton(
          onPressed: () {
            widget.onAdd(
              _trainingController.text,
              _selectedDate.toString().split(' ')[0],
              _selectedTrainingPlanId,
              _selectedContactId,
            );
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

  @override
  void dispose() {
    _trainingController.dispose();
    super.dispose();
  }
}
