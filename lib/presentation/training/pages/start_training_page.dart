import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';

class TrainingStartPage extends StatefulWidget {
  const TrainingStartPage({super.key});

  @override
  TrainingStartPageState createState() => TrainingStartPageState();
}

class TrainingStartPageState extends State<TrainingStartPage> {
  String? selectedPlan;
  bool isStarted = false;
  bool isPaused = false;
  late Stopwatch stopwatch;
  late Timer timer;
  Duration elapsed = Duration.zero;

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
    });
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
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white),
            ),
            DropdownButton<String>(
              dropdownColor:
                  Colors.black, // Set the background color of the dropdown menu
              hint: const Text('Select Plan',
                  style: TextStyle(
                      color: Colors.white)), // Change the hint text color
              value: selectedPlan,
              items: List.generate(
                10,
                (index) => DropdownMenuItem(
                  value: 'Training Plan ${index + 1}',
                  child: Text('Training Plan ${index + 1}',
                      style: const TextStyle(
                          color: Colors.white)), // Change the item text color
                ),
              ),
              onChanged: (value) {
                setState(() {
                  selectedPlan = value;
                });
              },
            ),
            if (selectedPlan != null && isStarted)
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Assume 5 exercises per training plan
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
      bottomNavigationBar: const MyBottomNavigationBar(
          currentIndex: 1), // Assuming Training is at index 1
    );
  }
}
