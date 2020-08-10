import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulsar_fit/models/responses/workout.dart';
import 'package:pulsar_fit/presentation/common/button.dart';
import 'package:pulsar_fit/presentation/common/level_indicators.dart';
import 'package:pulsar_fit/presentation/common/loader.dart';
import 'package:pulsar_fit/presentation/workouts/workout_exercise_list_tile.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:pulsar_fit/blocs/workout_details_bloc/bloc.dart';
import 'package:pulsar_fit/presentation/common/error.dart';

class WorkoutDetailsScreen extends StatefulWidget {
  static const String route = '/WorkoutDetailsScreen';

  final Workout workout;

  WorkoutDetailsScreen({@required this.workout}) : assert(workout != null);

  @override
  _WorkoutDetailsScreenState createState() => _WorkoutDetailsScreenState();
}

class _WorkoutDetailsScreenState extends State<WorkoutDetailsScreen> {
  @override
  void initState() {
    super.initState();

    context.bloc<WorkoutDetailsBloc>().add(LoadWorkoutDetailsEvent(id: widget.workout.id));
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    var top = constraints.biggest.height;

                    return FlexibleSpaceBar(
                      background: Image.network(
                        widget.workout.multimediaFile?.url.toNetworkPhotoUrl(),
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                        color: Colors.black45,
                      ),
                      centerTitle: top > 100,
                      title: top <= 100
                          ? Text(
                              widget.workout.name.cut(15),
                            )
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(widget.workout.name.cut(35)),
                                ],
                              ),
                            ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: LevelIndicators(
                  padding: const EdgeInsets.all(20),
                  cardioLevel: widget.workout.cardioLevel,
                  strengthLevel: widget.workout.strengthLevel,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ListTile(
                      title: Text(
                        context.localizer().translation.exercises,
                        style: TextStyle(
                          color: context.appTheme().theme.accentColor,
                        ),
                      ),
                    ),
                    BlocBuilder<WorkoutDetailsBloc, WorkoutDetailsState>(
                      builder: (context, state) {
                        if (state is LoadingWorkoutDetailsState) {
                          return Loader();
                        }

                        if (state is LoadedWorkoutDetailsState) {
                          if (state.workout.workoutExercises.isNotNullOrEmpty()) {
                            return Column(
                              children: state.workout.workoutExercises
                                  .map(
                                    (workoutExercise) => WorkoutExerciseListTile(workoutExercise: workoutExercise),
                                  )
                                  .toList(),
                            );
                          } else {
                            return Container();
                          }
                        }

                        return Error();
                      },
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                theme.primaryColor,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: Button.rounded(
                  child: Icon(
                    Icons.play_circle_filled,
                    color: Colors.white,
                    size: 30,
                  ),
                  padding: EdgeInsets.all(15),
                  color: theme.accentColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
