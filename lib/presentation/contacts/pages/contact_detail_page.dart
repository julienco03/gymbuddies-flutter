import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/contacts/widgets/contact_detail_view.dart';

class ContactDetailPage extends StatefulWidget {
  final int contactId;
  const ContactDetailPage({super.key, required this.contactId});

  @override
  ContactDetailPageState createState() => ContactDetailPageState();
}

class ContactDetailPageState extends State<ContactDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContactDetailView(contactId: widget.contactId),
    );
  }
}
