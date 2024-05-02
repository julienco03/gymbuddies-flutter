import 'package:flutter/material.dart';
import 'package:gymbuddies/common_layout.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CommonLayout(
      body: Text("Contacts"),
      selectedIndex: 3,
    );
  }
}
