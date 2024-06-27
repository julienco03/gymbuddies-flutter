import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/training_provider.dart';

class UpcomingTrainingsWidget extends ConsumerWidget {
  const UpcomingTrainingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final upcomingTrainingsAsyncValue = ref.watch(upcomingTrainingProvider);

    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(width: 20),
            Text('Upcoming', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const Padding(padding: EdgeInsetsDirectional.symmetric(horizontal: 40.0, vertical: 5.0)),
        upcomingTrainingsAsyncValue.when(
          data: (List<String> upcomingTrainings) {
            if (upcomingTrainings.length <= 4) {
              // No scrolling needed for 4 or less entries
              return _buildTrainingList(context, upcomingTrainings, screenWidth);
            } else {
              // Use ListView with horizontal scrolling for more than 4 entries
              return SizedBox(
                width: screenWidth,
                height: 150, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: upcomingTrainings.length,
                  itemBuilder: (context, index) => _buildTrainingItem(
                    context,
                    upcomingTrainings[index],
                    screenWidth * 0.85, // Adjust container width if needed
                  ),
                ),
              );
            }
          },
          loading: () => CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ],
    );
  }

  Widget _buildTrainingList(BuildContext context, List<String> trainings, double screenWidth) {
    return Row(
      children: trainings.map((String text) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTrainingItem(BuildContext context, String text, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0), // Adjust horizontal padding here
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: const [BoxShadow(color: Colors.black)],
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ),
    );
  }
}
