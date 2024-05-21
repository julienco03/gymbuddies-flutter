import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String contactName;
  final String trainingInformation;

  const ContactItem({
    super.key,
    required this.contactName,
    required this.trainingInformation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Card(
        child: ListTile(
          title: Text(contactName),
          subtitle: Text(trainingInformation),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.history),
                onPressed: () {
                  // Handle edit action
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  // Handle delete action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
