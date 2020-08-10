import 'package:flutter/material.dart';

abstract class WorkoutDetailsEvent {}

class LoadWorkoutDetailsEvent extends WorkoutDetailsEvent {
  int id;

  LoadWorkoutDetailsEvent({@required this.id}) : assert(id != null);
}
