import 'package:flutter/material.dart';
import 'package:pulsar_fit/models/search_requests/exercise_search_request.dart';

abstract class ExercisesEvent {}

class LoadExercisesEvent extends ExercisesEvent {}

class LoadMoreExercisesEvent extends ExercisesEvent {}

class RefreshExercisesEvent extends ExercisesEvent {}

class SearchExercisesEvent extends ExercisesEvent {
  final ExerciseSearchRequest exerciseSearchRequest;

  SearchExercisesEvent({
    @required this.exerciseSearchRequest,
  }) : assert(exerciseSearchRequest != null);
}

class ClearFiltersExercisesEvent extends ExercisesEvent {}
