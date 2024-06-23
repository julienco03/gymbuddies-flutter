import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/common/widgets/app_bar.dart';
import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';
import 'package:gymbuddies/presentation/contacts/widgets/add_new_contact_widget.dart';
import 'package:gymbuddies/presentation/contacts/widgets/contacts_list_widget.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  ContactsPageState createState() => ContactsPageState();
}

class ContactsPageState extends State<ContactsPage> {
  final int _currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactsListWidget(),
            SizedBox(height: 30.0),
            AddNewContactWidget(),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: _currentIndex),
    );
  }
}
