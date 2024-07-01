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
              data: (contacts) {
                return Column(
                  children: contacts.map((contact) {
                    return ListTile(
                      title: Text(contact['name'].toString()),
                      subtitle: Text(contact['email'].toString()),
                    );
                  }).toList(),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (err, stack) => Text('Error: $err'),
            ),
            const SizedBox(height: 30.0),
            AddNewContactWidget(
              emailController: _emailController,
              onAdd: () async {
                if (_emailController.text.isNotEmpty) {
                  await ref.read(databaseHelperProvider).insertContact(
                    'New Buddy', // Adjust this to fetch a name if needed
                    _emailController.text,
                  );
                  _emailController.clear();
                  ref.refresh(contactsProvider);
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: _currentIndex),
    );
  }
}
