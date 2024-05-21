import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/common/widgets/app_bar.dart';
import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';
import 'package:gymbuddies/presentation/home/widgets/recent_trainings_widget.dart';
import 'package:gymbuddies/presentation/home/widgets/start_training_button.dart';
import 'package:gymbuddies/presentation/home/widgets/upcoming_trainings_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [UpcomingTrainingsWidget()],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [RecentTrainingsWidget()],
          ),
          StartTrainingButton(
            onPressed: () {
              Navigator.pushNamed(context, '/training/start');
            },
          ),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: _currentIndex),
    );
  }
}
