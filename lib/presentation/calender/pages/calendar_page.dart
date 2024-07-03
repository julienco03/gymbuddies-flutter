import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/presentation/calender/widgets/calendar_view.dart';
import 'package:gymbuddies/presentation/common/widgets/app_bar.dart';
import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';
import 'package:gymbuddies/providers/trainings_plan_update_provider.dart';
import 'package:gymbuddies/database/database_helper.dart';
import '../widgets/add_training_event_dialog.dart';
import 'package:gymbuddies/providers/upcoming_trainings_provider.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final upcomingTrainings = ref.watch(upcomingTrainingsProvider);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 500,
              child: EventCalenderWidget(),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 4000,
              ),
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: upcomingTrainings.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(upcomingTrainings[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await DatabaseHelper().deleteUpcomingTraining(upcomingTrainings[index] as int);
                        ref.refresh(trainingPlanUpdateProvider);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTrainingDialog(context, ref),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: 2),
    );
  }

  void _showAddTrainingDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AddTrainingEventDialog(onAdd: (training, date, trainingPlan, contact) {
          ref.read(upcomingTrainingsProvider.notifier).addTraining(
            trainingPlan != null && contact != null
                ? '$training on $date with $trainingPlan and $contact'
                : trainingPlan != null
                    ? '$training on $date with $trainingPlan'
                    : contact != null
                        ? '$training on $date with $contact'
                        : '$training on $date',
          );
        });
      },
    );
  }
}
