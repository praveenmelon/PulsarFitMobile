import 'package:flutter/material.dart';
import 'package:pulsar_fit/models/responses/workout_exercise.dart';
import 'package:pulsar_fit/presentation/common/title_list_tile.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:pulsar_fit/presentation/exercises/exercise_details_screen.dart';

class WorkoutExerciseListTile extends StatelessWidget {
  final WorkoutExercise workoutExercise;
  final bool isRest;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  WorkoutExerciseListTile({
    @required this.workoutExercise,
    this.isRest = false,
    this.padding: const EdgeInsets.all(15),
    this.margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
  }) : assert(workoutExercise != null);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    if (isRest) {
      return TitleListTile(
        'Rest',
        centerText: true,
        color: _theme.primaryColor,
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      );
    }

    return Container(
      margin: margin,
      color: _theme.primaryColor,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.navigator().pushNamed(ExerciseDetailsScreen.route, arguments: workoutExercise.exercise);
          },
          child: Container(
            padding: padding,
            child: Material(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              workoutExercise.exercise?.multimediaFile?.url.toNetworkPhotoUrl(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(workoutExercise.exercise.name.cut(25)),
                    ],
                  ),
                  Chip(
                    label: Text(workoutExercise.numberOfRepetitions?.toString() ?? ''),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
