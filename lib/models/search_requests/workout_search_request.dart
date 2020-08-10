import 'package:pulsar_fit/models/enumerations/cardio_level.dart';
import 'package:pulsar_fit/models/enumerations/strength_level.dart';

import 'trainer_search_request.dart';
import 'multimedia_file_search_request.dart';
import 'plan_workout_search_request.dart';
import 'workout_exercise_search_request.dart';
import 'pagination.dart';

class WorkoutSearchRequest {
  int id;
  String name;
  String description;
  StrengthLevel strengthLevel;
  CardioLevel cardioLevel;
  bool isPublic;
  int trainerId;
  int multimediaFileId;
  TrainerSearchRequest trainer;
  MultimediaFileSearchRequest multimediaFile;
  PlanWorkoutSearchRequest planWorkouts;
  WorkoutExerciseSearchRequest workoutExercises;
  bool includeTrainer;
  bool includeMultimediaFile;
  bool includePlanWorkouts;
  bool includeWorkoutExercises;

  Pagination pagination;

  WorkoutSearchRequest({
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
    this.includeTrainer,
    this.includeMultimediaFile,
    this.includePlanWorkouts,
    this.includeWorkoutExercises,
    this.pagination,
  }) {
    pagination ??= Pagination();
  }

  WorkoutSearchRequest copyWith({
    int id,
    String name,
    String description,
    StrengthLevel strengthLevel,
    CardioLevel cardioLevel,
    bool isPublic,
    int trainerId,
    int multimediaFileId,
    TrainerSearchRequest trainer,
    MultimediaFileSearchRequest multimediaFile,
    PlanWorkoutSearchRequest planWorkouts,
    WorkoutExerciseSearchRequest workoutExercises,
    bool includeTrainer,
    bool includeMultimediaFile,
    bool includePlanWorkouts,
    bool includeWorkoutExercises,
    Pagination pagination,
  }) {
    return WorkoutSearchRequest(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      strengthLevel: strengthLevel ?? this.strengthLevel,
      cardioLevel: cardioLevel ?? this.cardioLevel,
      isPublic: isPublic ?? this.isPublic,
      trainerId: trainerId ?? this.trainerId,
      multimediaFileId: multimediaFileId ?? this.multimediaFileId,
      trainer: trainer ?? this.trainer,
      multimediaFile: multimediaFile ?? this.multimediaFile,
      planWorkouts: planWorkouts ?? this.planWorkouts,
      workoutExercises: workoutExercises ?? this.workoutExercises,
      includeTrainer: includeTrainer ?? this.includeTrainer,
      includeMultimediaFile: includeMultimediaFile ?? this.includeMultimediaFile,
      includePlanWorkouts: includePlanWorkouts ?? this.includePlanWorkouts,
      includeWorkoutExercises: includeWorkoutExercises ?? this.includeWorkoutExercises,
      pagination: pagination ?? this.pagination,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'strengthLevel': strengthLevel?.index,
      'cardioLevel': cardioLevel?.index,
      'isPublic': isPublic,
      'trainerId': trainerId,
      'multimediaFileId': multimediaFileId,
      'trainer': trainer?.toJson(),
      'multimediaFile': multimediaFile?.toJson(),
      'planWorkouts': planWorkouts?.toJson(),
      'workoutExercises': workoutExercises?.toJson(),
      'includeTrainer': includeTrainer,
      'includeMultimediaFile': includeMultimediaFile,
      'includePlanWorkouts': includePlanWorkouts,
      'includeWorkoutExercises': includeWorkoutExercises,
      'pagination': pagination?.toJson(),
    };
  }
}
