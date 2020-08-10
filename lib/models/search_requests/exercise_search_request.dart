import 'trainer_search_request.dart';
import 'exercise_category_search_request.dart';
import 'multimedia_file_search_request.dart';
import 'workout_exercise_search_request.dart';
import 'pagination.dart';

class ExerciseSearchRequest {
int id;
String name;
String description;
bool isPublic;
int trainerId;
int exerciseCategoryId;
int multimediaFileId;
TrainerSearchRequest trainer;
ExerciseCategorySearchRequest exerciseCategory;
MultimediaFileSearchRequest multimediaFile;
WorkoutExerciseSearchRequest workoutExercises;
bool includeTrainer;
bool includeExerciseCategory;
bool includeMultimediaFile;
bool includeWorkoutExercises;

Pagination pagination;

ExerciseSearchRequest({
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
this.includeTrainer,
this.includeExerciseCategory,
this.includeMultimediaFile,
this.includeWorkoutExercises,
this.pagination,
}){
pagination ??= Pagination();
}

ExerciseSearchRequest copyWith({
int id,
String name,
String description,
bool isPublic,
int trainerId,
int exerciseCategoryId,
int multimediaFileId,
TrainerSearchRequest trainer,
ExerciseCategorySearchRequest exerciseCategory,
MultimediaFileSearchRequest multimediaFile,
WorkoutExerciseSearchRequest workoutExercises,
bool includeTrainer,
bool includeExerciseCategory,
bool includeMultimediaFile,
bool includeWorkoutExercises,
Pagination pagination,
}) {
return ExerciseSearchRequest(
id: id ?? this.id,
name: name ?? this.name,
description: description ?? this.description,
isPublic: isPublic ?? this.isPublic,
trainerId: trainerId ?? this.trainerId,
exerciseCategoryId: exerciseCategoryId ?? this.exerciseCategoryId,
multimediaFileId: multimediaFileId ?? this.multimediaFileId,
trainer: trainer ?? this.trainer,
exerciseCategory: exerciseCategory ?? this.exerciseCategory,
multimediaFile: multimediaFile ?? this.multimediaFile,
workoutExercises: workoutExercises ?? this.workoutExercises,
includeTrainer: includeTrainer ?? this.includeTrainer,
includeExerciseCategory: includeExerciseCategory ?? this.includeExerciseCategory,
includeMultimediaFile: includeMultimediaFile ?? this.includeMultimediaFile,
includeWorkoutExercises: includeWorkoutExercises ?? this.includeWorkoutExercises,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'name':name,
'description':description,
'isPublic':isPublic,
'trainerId':trainerId,
'exerciseCategoryId':exerciseCategoryId,
'multimediaFileId':multimediaFileId,
'trainer':trainer?.toJson(),
'exerciseCategory':exerciseCategory?.toJson(),
'multimediaFile':multimediaFile?.toJson(),
'workoutExercises':workoutExercises?.toJson(),
'includeTrainer':includeTrainer,
'includeExerciseCategory':includeExerciseCategory,
'includeMultimediaFile':includeMultimediaFile,
'includeWorkoutExercises':includeWorkoutExercises,
'pagination': pagination?.toJson(),};
}

}