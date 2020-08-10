import 'package:flutter/material.dart';
import 'package:pulsar_fit/models/search_requests/workout_search_request.dart';

abstract class WorkoutsEvent {}

class LoadWorkoutsEvent extends WorkoutsEvent {}

class LoadMoreWorkoutsEvent extends WorkoutsEvent {}

class RefreshWorkoutsEvent extends WorkoutsEvent {}

class SearchWorkoutsEvent extends WorkoutsEvent {
  final WorkoutSearchRequest workoutSearchRequest;

  SearchWorkoutsEvent({
    @required this.workoutSearchRequest,
  }) : assert(workoutSearchRequest != null);
}

class ClearFiltersWorkoutsEvent extends WorkoutsEvent {}
