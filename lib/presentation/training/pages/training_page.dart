import 'package:flutter/material.dart';
import 'package:gymbuddies/presentation/common/widgets/app_bar.dart';
import 'package:gymbuddies/presentation/common/widgets/bottom_navigation_bar.dart';
import 'package:gymbuddies/presentation/training/widgets/training_plan_item.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  TrainingPageState createState() => TrainingPageState();
}

class TrainingPageState extends State<TrainingPage> {
  final int _currentIndex = 1;
  final String _pageTitle = 'Training Plans';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: MyAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _pageTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                          10,
                          (index) => TrainingPlanItem(
                                title: 'Training Plan ${index + 1}',
                                subtitle: '1:30h | last trained: 5 May',
                              )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: _currentIndex),
    );
  }
}
