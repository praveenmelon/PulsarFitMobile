import 'package:flutter/material.dart';
import 'package:pulsar_fit/models/responses/workout.dart';
import 'package:pulsar_fit/models/search_requests/workout_search_request.dart';

abstract class WorkoutsState {
  List<Workout> workouts;
  WorkoutSearchRequest workoutSearchRequest;
  bool get areFiltersSet => workoutSearchRequest.name?.isNotEmpty ?? false;

  WorkoutsState({
    this.workouts,
    @required this.workoutSearchRequest,
  }) : assert(workoutSearchRequest != null);
}

class LoadingWorkoutsState extends WorkoutsState {
  LoadingWorkoutsState({
    @required WorkoutSearchRequest workoutSearchRequest,
  })  : assert(workoutSearchRequest != null),
        super(workoutSearchRequest: workoutSearchRequest);
}

class LoadedWorkoutsState extends WorkoutsState {
  LoadedWorkoutsState({
    List<Workout> workouts,
    @required WorkoutSearchRequest workoutSearchRequest,
  }) : super(
          workouts: workouts,
          workoutSearchRequest: workoutSearchRequest,
        );
}
