import 'package:flutter/material.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:pulsar_fit/models/responses/exercise.dart';
import 'package:pulsar_fit/presentation/exercises/exercise_details_screen.dart';

class ExerciseListTile extends StatelessWidget {
  final Exercise exercise;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  ExerciseListTile({
    this.exercise,
    this.padding: const EdgeInsets.all(15),
    this.margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
  });

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      margin: margin,
      color: _theme.primaryColor,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            context.navigator().pushNamed(ExerciseDetailsScreen.route, arguments: exercise);
          },
          child: Container(
            padding: padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            exercise.multimediaFile?.url.toNetworkPhotoUrl(),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(exercise.name?.cut(40)),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right, size: 30.0, color: context.appTheme().theme.accentColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
