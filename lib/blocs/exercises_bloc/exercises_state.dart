import 'package:flutter/material.dart';
import 'package:pulsar_fit/models/responses/exercise.dart';
import 'package:pulsar_fit/models/search_requests/exercise_search_request.dart';

abstract class ExercisesState {
  List<Exercise> exercises;
  ExerciseSearchRequest exerciseSearchRequest;
  bool get areFiltersSet => exerciseSearchRequest.name?.isNotEmpty ?? false;

  ExercisesState({
    this.exercises,
    @required this.exerciseSearchRequest,
  }) : assert(exerciseSearchRequest != null);
}

class LoadingExercisesState extends ExercisesState {
  LoadingExercisesState({
    @required ExerciseSearchRequest exerciseSearchRequest,
  })  : assert(exerciseSearchRequest != null),
        super(exerciseSearchRequest: exerciseSearchRequest);
}

class LoadedExercisesState extends ExercisesState {
  LoadedExercisesState({
    List<Exercise> exercises,
    @required ExerciseSearchRequest exerciseSearchRequest,
  }) : super(
          exercises: exercises,
          exerciseSearchRequest: exerciseSearchRequest,
        );
}
