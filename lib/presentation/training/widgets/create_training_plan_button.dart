import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/database/database_helper.dart';
import 'package:gymbuddies/presentation/common/themes/app_theme.dart';
import 'package:gymbuddies/providers/trainings_plan_update_provider.dart';
import 'package:path/path.dart';

class CreateTrainingPlanButton extends ConsumerWidget {
  const CreateTrainingPlanButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => _showAddTrainingPlanDialog(context, ref),
      child: const Icon(Icons.add),
    );
  }

  void _showAddTrainingPlanDialog(BuildContext context, WidgetRef ref) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Training Plan'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name', 
                labelStyle: TextStyle(color: AppColors.accentColor), 
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor),),),
                style: TextStyle( color: Theme.of(context).primaryColor),
                cursorColor: Theme.of(context).primaryColor,
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description', 
                labelStyle: TextStyle(color: AppColors.accentColor), 
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColors.accentColor),),),
                style: TextStyle( color: Theme.of(context).primaryColor),
                cursorColor: Theme.of(context).primaryColor,
              ),
            ],
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Theme.of(context).primaryColor),
              onPressed: () async {
                if (nameController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
                  await DatabaseHelper().insertTrainingPlan(
                    nameController.text,
                    descriptionController.text,
                  );
                  ref.refresh(trainingPlanUpdateProvider);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Training Plan added successfully', style: TextStyle(color: Colors.green))),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please fill in all fields', style: TextStyle(color: Colors.green))),
                  );
                }
              },
              child: const Text('Add', style: TextStyle(color: Colors.green)),
            ),
          ],
        );
      },
    );
  }
}
