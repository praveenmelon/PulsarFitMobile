import 'trainer.dart';
import 'exercise_category.dart';
import 'multimedia_file.dart';
import 'workout_exercise.dart';

class Exercise {
  int id;
  String name;
  String description;
  bool isPublic;
  int trainerId;
  int exerciseCategoryId;
  int multimediaFileId;
  Trainer trainer;
  ExerciseCategory exerciseCategory;
  MultimediaFile multimediaFile;
  List<WorkoutExercise> workoutExercises;

  Exercise({
    this.id,
    this.name,
    this.description,
    this.isPublic,
    this.trainerId,
    this.exerciseCategoryId,
    this.multimediaFileId,
    this.trainer,
    this.exerciseCategory,
    this.multimediaFile,
    this.workoutExercises,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return Exercise(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        isPublic: json['isPublic'],
        trainerId: json['trainerId'],
        exerciseCategoryId: json['exerciseCategoryId'],
        multimediaFileId: json['multimediaFileId'],
        trainer: Trainer.fromJson(json['trainer']),
        exerciseCategory: ExerciseCategory.fromJson(json['exerciseCategory']),
        multimediaFile: MultimediaFile.fromJson(json['multimediaFile']),
        workoutExercises: json['workoutExercises']?.map<WorkoutExercise>((json) => WorkoutExercise.fromJson(json))?.toList(),
      );
    }
    return null;
  }
}
