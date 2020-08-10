import 'package:pulsar_fit/models/responses/workout.dart';

abstract class WorkoutDetailsState {}

class LoadingWorkoutDetailsState extends WorkoutDetailsState {}

class LoadedWorkoutDetailsState extends WorkoutDetailsState {
  Workout workout;
  LoadedWorkoutDetailsState({this.workout});
}
