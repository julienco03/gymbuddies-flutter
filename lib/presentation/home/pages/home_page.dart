import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/common/themes/app_theme.dart';
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
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [UpcomingTrainingsWidget()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [RecentTrainingsWidget()],
          ),
          StartTrainingButton()
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
