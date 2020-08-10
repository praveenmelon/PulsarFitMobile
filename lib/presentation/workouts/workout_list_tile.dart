import 'package:flutter/material.dart';
import 'package:pulsar_fit/models/enumerations/cardio_level.dart';
import 'package:pulsar_fit/models/enumerations/strength_level.dart';
import 'package:pulsar_fit/models/responses/workout.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:pulsar_fit/presentation/common/level_indicators.dart';
import 'package:pulsar_fit/presentation/workouts/workout_details_screen.dart';

class WorkoutListTile extends StatelessWidget {
  final Workout workout;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  WorkoutListTile({
    this.workout,
    this.padding: const EdgeInsets.all(15),
    this.margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.appTheme();

    return Container(
      margin: margin,
      color: appTheme.theme.primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              context.navigator().pushNamed(WorkoutDetailsScreen.route, arguments: workout);
            },
            child: Container(
              padding: padding,
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(workout.multimediaFile?.url.toNetworkPhotoUrl()),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      workout.name,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          LevelIndicators(
            cardioLevel: workout.cardioLevel,
            strengthLevel: workout.strengthLevel,
          ),
        ],
      ),
    );
  }
}
