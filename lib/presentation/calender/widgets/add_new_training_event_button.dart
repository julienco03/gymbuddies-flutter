import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewTrainingEventWidget extends ConsumerWidget {
  final FutureProvider<List<Map<String, dynamic>>> contactsProvider;

  const AddNewTrainingEventWidget({
    required this.contactsProvider,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () async {
        final contactsAsyncValue = ref.read(contactsProvider);

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add New Training Event'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Event Title',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  contactsAsyncValue.when(
                    data: (contacts) {
                      return DropdownButton<String>(
                        hint: const Text('Select Buddy'),
                        items: contacts.map<DropdownMenuItem<String>>((contact) {
                          return DropdownMenuItem<String>(
                            value: contact['email'].toString(),
                            child: Text(contact['name'].toString()),
                          );
                        }).toList(),
                        onChanged: (value) {
                          // Handle selected buddy
                        },
                      );
                    },
                    loading: () => const CircularProgressIndicator(),
                    error: (err, stack) => Text('Error: $err'),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    // Handle adding new training event
                    Navigator.of(context).pop();
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
