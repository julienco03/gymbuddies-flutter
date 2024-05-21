import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/contacts/widgets/contact_item.dart';

class ContactsListWidget extends StatelessWidget {
  const ContactsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const String contactsListTitle = 'Buddies';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          contactsListTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8.0,
        ),
        SizedBox(
          height: 300.0,
          child: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: List.generate(
                      10,
                      (index) => ContactItem(
                        contactName: 'Buddy ${index + 1}',
                        trainingInformation:
                            'Trainings: $index | last trained: 5 May',
                      ),
                    ),
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
