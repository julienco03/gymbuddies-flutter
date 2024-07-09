import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/recent_training_provider.dart';

class RecentTrainingsWidget extends ConsumerWidget {
  const RecentTrainingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentTrainingsAsyncValue = ref.watch(recentTrainingProvider);

    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            Text('Recent Trainings', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
        const Padding(
            padding: EdgeInsetsDirectional.symmetric(
                horizontal: 40.0, vertical: 5.0)),
        recentTrainingsAsyncValue.when(
          data: (List<String> recentTrainings) {
            if (recentTrainings.length <= 4) {
              // No scrolling needed for 4 or less entries
              return _buildTrainingList(
                  context, recentTrainings, screenWidth);
            } else {
              return SizedBox(
                width: screenWidth,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: recentTrainings.length,
                  itemBuilder: (context, index) => _buildTrainingItem(
                    context,
                    recentTrainings[index],
                    screenWidth * 0.85,
                  ),
                ),
              );
            }
          },
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ],
    );
  }

  Widget _buildTrainingList(
      BuildContext context, List<String> trainings, double screenWidth) {
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
      padding: const EdgeInsets.symmetric(
          vertical: 5.0, horizontal: 5.0),
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
