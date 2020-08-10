import 'workout.dart';
import 'exercise.dart';
import 'workout_session.dart';

class WorkoutExercise {
  int id;
  int numberOfRepetitions;
  int numberOfCalories;
  int durationInSeconds;
  int orderNumber;
  int workoutId;
  int exerciseId;
  Workout workout;
  Exercise exercise;
  List<WorkoutSession> workoutSessions;

  WorkoutExercise({
    this.id,
    this.numberOfRepetitions,
    this.numberOfCalories,
    this.durationInSeconds,
    this.orderNumber,
    this.workoutId,
    this.exerciseId,
    this.workout,
    this.exercise,
    this.workoutSessions,
  });

  factory WorkoutExercise.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return WorkoutExercise(
        id: json['id'],
        numberOfRepetitions: json['numberOfRepetitions'],
        numberOfCalories: json['numberOfCalories'],
        durationInSeconds: json['durationInSeconds'],
        orderNumber: json['orderNumber'],
        workoutId: json['workoutId'],
        exerciseId: json['exerciseId'],
        workout: Workout.fromJson(json['workout']),
        exercise: Exercise.fromJson(json['exercise']),
        workoutSessions: json['workoutSessions']?.map<WorkoutSession>((json) => WorkoutSession.fromJson(json))?.toList(),
      );
    }
    return null;
  }
}
