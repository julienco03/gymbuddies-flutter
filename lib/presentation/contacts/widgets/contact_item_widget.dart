import 'package:flutter/material.dart';
import 'package:gymbuddies/database/database_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/providers/contact_provider.dart';

class ContactItem extends ConsumerWidget {
  final String contactName;
  final int contactId;
  final String trainingInformation;

  const ContactItem({
    super.key,
    required this.contactName,
    required this.contactId,
    required this.trainingInformation,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dbHelper = DatabaseHelper();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        child: ListTile(
          title: Text(contactName),
          subtitle: Text(trainingInformation),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              try {
                await dbHelper.deleteContact(contactId);
                ref.refresh(contactsProvider);
              } catch (e) {
                print('Error deleting contact: $e');
              }
            },
          ),
        ),
      ),
    );
  }
}
