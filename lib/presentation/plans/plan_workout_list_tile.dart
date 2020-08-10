import 'package:flutter/material.dart';
import 'package:pulsar_fit/models/responses/plan_workout.dart';
import 'package:pulsar_fit/presentation/common/title_list_tile.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:pulsar_fit/presentation/workouts/workout_details_screen.dart';

class PlanWorkoutListTile extends StatelessWidget {
  final PlanWorkout planWorkout;
  final bool isRest;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  PlanWorkoutListTile({
    @required this.planWorkout,
    this.isRest = false,
    this.padding: const EdgeInsets.all(15),
    this.margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
  }) : assert(planWorkout != null);

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    if (isRest) {
      return TitleListTile(
        'Rest',
        centerText: true,
        color: _theme.primaryColor,
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      );
    }

    return Container(
      margin: margin,
      color: _theme.primaryColor,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.navigator().pushNamed(WorkoutDetailsScreen.route, arguments: planWorkout.workout);
          },
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(planWorkout.workout?.multimediaFile?.url.toNetworkPhotoUrl()),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(planWorkout.workout.name.cut(20)),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  size: 30.0,
                  color: context.appTheme().theme.accentColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
