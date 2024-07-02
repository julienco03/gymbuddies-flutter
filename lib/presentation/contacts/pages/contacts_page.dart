import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/contact_provider.dart';
import 'package:gymbuddies/presentation/common/widgets/app_bar.dart';
import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';
import 'package:gymbuddies/presentation/contacts/widgets/add_new_contact_widget.dart';
import 'package:gymbuddies/presentation/contacts/widgets/contacts_list_widget.dart';

class ContactsPage extends ConsumerStatefulWidget {
  const ContactsPage({super.key});

  @override
  ConsumerState<ContactsPage> createState() => ContactsPageState();
}

class ContactsPageState extends ConsumerState<ContactsPage> {
  final int _currentIndex = 3;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final contactsAsyncValue = ref.watch(contactsProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            contactsAsyncValue.when(
              data: (contacts) => ContactsListWidget(contacts: contacts),
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
            ),
            const SizedBox(height: 10.0),
            AddNewContactWidget(
              nameController: _nameController,
              emailController: _emailController,
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: _currentIndex),
    );
  }
}
