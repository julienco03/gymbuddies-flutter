import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/contacts/widgets/contact_item_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/contact_provider.dart';

class ContactsListWidget extends ConsumerWidget {
  const ContactsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String contactsListTitle = 'Buddies';
    double screenHeight = MediaQuery.of(context).size.height;
    final contactsAsyncValue = ref.watch(contactsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contactsListTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8.0),
        SizedBox(
          height: screenHeight * 0.4,
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: contactsAsyncValue.when(
                    data: (contacts) => Column(
                      children: contacts.map((contact) {
                        return ContactItem(
                          contactName: contact['name'].toString(),
                          trainingInformation: 'Email: ${contact['email']}',
                          contactId: contact['id'] as int,
                        );
                      }).toList(),
                    ),
                    loading: () => const CircularProgressIndicator(),
                    error: (err, stack) => Text('Error: $err'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
