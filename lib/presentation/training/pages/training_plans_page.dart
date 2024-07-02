import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/presentation/common/widgets/app_bar.dart';
import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';
import 'package:gymbuddies/database/database_helper.dart';
import 'package:gymbuddies/presentation/training/widgets/create_training_plan_button.dart';
import 'package:gymbuddies/providers/trainings_plan_update_provider.dart';
class TrainingPage extends ConsumerStatefulWidget {
  const TrainingPage({super.key});

  @override
  TrainingPageState createState() => TrainingPageState();
}

class TrainingPageState extends ConsumerState<TrainingPage> {
  final String _pageTitle = 'Training Plans';


  @override
  void initState() {
    super.initState();
    _refreshTrainingPlans();
  }

  void _refreshTrainingPlans() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    final trainingPlansAsyncValue = ref.watch(trainingPlanUpdateProvider);

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  _pageTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                )
              ],
            ),
            const SizedBox(height: 8.0),
            trainingPlansAsyncValue.when(
              data: (trainingPlans) {
                if (trainingPlans.isEmpty) {
                  return Text('No training plans found.', style: TextStyle(color: Theme.of(context).primaryColor));
                }
                return SizedBox(
                  height: 400,
                  child: ListView.builder(
                    itemCount: trainingPlans.length,
                    itemBuilder: (context, index) {
                      final trainingPlan = trainingPlans[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0), // Add space between items
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ListTile(
                        title: Text(
                          trainingPlan['name'].toString(),
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        subtitle: Text(
                          trainingPlan['description'].toString(),
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Theme.of(context).primaryColor),
                          onPressed: () async {
                            await DatabaseHelper().deleteTrainingPlan(trainingPlan['id'] as int);
                            ref.refresh(trainingPlanUpdateProvider);
                          },
                        ),
                      )
                      );
                    },
                  ),
                );
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) => Text('Error: $error', style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ],
        ),
      ),
      floatingActionButton: const CreateTrainingPlanButton(),
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 1),
    );
  }
}
