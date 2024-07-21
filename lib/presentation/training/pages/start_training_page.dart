import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import 'package:gymbuddies/database/database_helper.dart';
import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';
import 'package:gymbuddies/providers/recent_training_provider.dart';

class TrainingStartPage extends ConsumerStatefulWidget {
  const TrainingStartPage({super.key});

  @override
  TrainingStartPageState createState() => TrainingStartPageState();
}

class TrainingStartPageState extends ConsumerState<TrainingStartPage> {
  String? selectedPlan;
  bool isStarted = false;
  bool isPaused = false;
  late Stopwatch stopwatch;
  late Timer timer;
  Duration elapsed = Duration.zero;
  List<Map<String, dynamic>> trainingPlans = [];

  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (stopwatch.isRunning) {
          elapsed = stopwatch.elapsed;
        }
      });
    });
    _fetchTrainingPlans();
  }

  Future<void> _fetchTrainingPlans() async {
    final plans = await DatabaseHelper().getTrainingPlans();
    setState(() {
      trainingPlans = plans;
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    setState(() {
      isStarted = true;
      isPaused = false;
      stopwatch.start();
    });
  }

  void pauseTimer() {
    setState(() {
      isPaused = true;
      stopwatch.stop();
    });
  }

  void stopTimer() {
    setState(() {
      isStarted = false;
      isPaused = false;
      stopwatch.stop();
      stopwatch.reset();
      elapsed = Duration.zero;
      _saveTrainingDialog();
    });
  }

  Future<void> _saveTrainingDialog() async {
    final TextEditingController controller = TextEditingController();
    bool isButtonDisabled = true;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Save Training', style: TextStyle(color: Colors.green)),
              content: TextField(
                controller: controller,
                decoration: const InputDecoration(hintText: 'Enter training name'),
                onChanged: (text) {
                  setState(() {
                    isButtonDisabled = text.isEmpty;
                  });
                },
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                          final trainingName = controller.text;
                          if (trainingName.isNotEmpty) {
                            await DatabaseHelper().insertRecentTraining(trainingName, DateTime.now());
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Training saved successfully')),
                            );
                            ref.refresh(recentTrainingProvider);
                          }
                        },
                  child: const Text('Save', style: TextStyle(color: Colors.green)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel', style: TextStyle(color: Colors.green)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Training'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Elapsed Time: ${elapsed.inMinutes}:${(elapsed.inSeconds % 60).toString().padLeft(2, '0')}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            DropdownButton<String>(
              hint: Text('Select Plan', style: TextStyle(color: Theme.of(context).primaryColor)),
              value: selectedPlan,
              items: trainingPlans.map((plan) {
                return DropdownMenuItem<String>(
                  value: plan['name']?.toString(),
                  child: Text(plan['name']?.toString() ?? 'Unknown Plan', style: TextStyle(color: Theme.of(context).primaryColor)),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedPlan = value;
                });
              },
            ),
            if (selectedPlan != null && isStarted)
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Exercise ${index + 1} for $selectedPlan'),
                    );
                  },
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: selectedPlan != null && (!isStarted || isPaused)
                      ? startTimer
                      : null,
                  child: const Text('Start'),
                ),
                ElevatedButton(
                  onPressed: isStarted && !isPaused ? pauseTimer : null,
                  child: const Text('Pause'),
                ),
                ElevatedButton(
                  onPressed: isStarted ? stopTimer : null,
                  child: const Text('Stop'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomNavigationBar(currentIndex: 1),
    );
  }
}
