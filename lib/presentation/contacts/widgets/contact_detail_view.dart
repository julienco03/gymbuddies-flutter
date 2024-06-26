import 'package:flutter/material.dart';

class ContactDetailView extends StatelessWidget {
  final int contactId;
  const ContactDetailView({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact ID: $contactId'),
      ),
      body: null,
    );
  }
}
