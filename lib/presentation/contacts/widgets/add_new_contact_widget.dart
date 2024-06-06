import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/common/themes/app_theme.dart';
import 'package:gymbuddies/presentation/common/widgets/input_textfield.dart';

class AddNewContactWidget extends StatelessWidget {
  const AddNewContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const String addNewContactTitle = 'Add New Buddies';
    const String emailInputLabel = 'Email of Your Buddy';
    const String sendInvitationLabel = 'Send Invitation to Buddy';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          addNewContactTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: 8.0,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
                  child: InputTextField(inputLabel: emailInputLabel),
                ),
                ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        sendInvitationLabel,
                        style: TextStyle(
                            color: Theme.of(context).iconTheme.color,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      IconButton(
                        icon: const Icon(Icons.send),
                        color: AppColors.accentColor,
                        onPressed: () {
                          // Sende mail und zeige popup mit erfolgsmeldung
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
