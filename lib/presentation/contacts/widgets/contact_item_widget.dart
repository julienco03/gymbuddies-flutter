import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContactItem extends StatelessWidget {
  final String contactName;
  final String trainingInformation;
  final int contactId;

  const ContactItem({
    super.key,
    required this.contactName,
    required this.trainingInformation,
    required this.contactId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        child: ListTile(
          title: Text(contactName),
          subtitle: Text(trainingInformation),
          trailing: IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              // Handle edit action
            },
          ),
          onTap: () {
            context.push('/contacts/detail/$contactId');
          },
        ),
      ),
    );
  }
}
