import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gymbuddies/presentation/common/themes/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/database/database_helper.dart';
import 'package:gymbuddies/providers/contact_provider.dart';

class AddNewContactWidget extends ConsumerWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;

  const AddNewContactWidget({
    Key? key,
    required this.nameController,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String addNewContactTitle = 'Add New Buddies';
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
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name', 
                        labelStyle: TextStyle(color: AppColors.accentColor), 
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor),),
                      ),
                      style: TextStyle( color: Theme.of(context).iconTheme.color),
                      cursorColor: Theme.of(context).iconTheme.color,
                    ),                      
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email', 
                        labelStyle: TextStyle(color: AppColors.accentColor), 
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor),),
                      ),
                      style: TextStyle( color: Theme.of(context).iconTheme.color),
                      cursorColor: Theme.of(context).iconTheme.color,
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
                        onPressed: () async {
                          final dbHelper = DatabaseHelper();
                          try {
                            await dbHelper.insertContact(nameController.text, emailController.text);
                            ref.refresh(contactsProvider);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Contact added successfully')),
                            );
                          } catch (e) {
                            if (e is ContactAlreadyExistsException) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.message)),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('An error occurred')),
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),        
              ],
            ),
          ),
        ),
      ],
    );
  }
}
