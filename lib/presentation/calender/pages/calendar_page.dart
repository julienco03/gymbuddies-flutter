import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymbuddies/presentation/calender/widgets/calendar_view.dart';
import 'package:gymbuddies/presentation/common/widgets/app_bar.dart';
import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';
import 'package:gymbuddies/providers/upcoming_trainings_provider.dart';
import '../utils/add_training_event_dialog.dart';

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
                maxHeight: 400,
              ),
              child: ListView.builder(
                controller: _scrollController,
                shrinkWrap: true,
                itemCount: upcomingTrainings.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(upcomingTrainings[index]),
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
        return AddTrainingEventDialog(onAdd: (training, date) {
          ref.read(upcomingTrainingsProvider.notifier).addTraining('$training on $date');
        });
      },
    );
  }
}
