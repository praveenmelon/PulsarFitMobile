import 'package:pulsar_fit/models/enumerations/cardio_level.dart';
import 'package:pulsar_fit/models/enumerations/strength_level.dart';

import 'trainer.dart';
import 'multimedia_file.dart';
import 'plan_workout.dart';
import 'workout_exercise.dart';

class Workout {
  int id;
  String name;
  String description;
  StrengthLevel strengthLevel;
  CardioLevel cardioLevel;
  bool isPublic;
  int trainerId;
  int multimediaFileId;
  Trainer trainer;
  MultimediaFile multimediaFile;
  List<PlanWorkout> planWorkouts;
  List<WorkoutExercise> workoutExercises;

  Workout({
    this.id,
    this.name,
    this.description,
    this.strengthLevel,
    this.cardioLevel,
    this.isPublic,
    this.trainerId,
    this.multimediaFileId,
    this.trainer,
    this.multimediaFile,
    this.planWorkouts,
    this.workoutExercises,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return Workout(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        strengthLevel: StrengthLevel.getValue(json['strengthLevel']),
        cardioLevel: CardioLevel.getValue(json['cardioLevel']),
        isPublic: json['isPublic'],
        trainerId: json['trainerId'],
        multimediaFileId: json['multimediaFileId'],
        trainer: Trainer.fromJson(json['trainer']),
        multimediaFile: MultimediaFile.fromJson(json['multimediaFile']),
        planWorkouts: json['planWorkouts']?.map<PlanWorkout>((json) => PlanWorkout.fromJson(json))?.toList(),
        workoutExercises: json['workoutExercises']?.map<WorkoutExercise>((json) => WorkoutExercise.fromJson(json))?.toList(),
      );
    }
    return null;
  }
}
