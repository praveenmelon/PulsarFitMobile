import 'workout_search_request.dart';
import 'exercise_search_request.dart';
import 'workout_session_search_request.dart';
import 'pagination.dart';

class WorkoutExerciseSearchRequest {
int id;
int numberOfRepetitions;
int numberOfCalories;
int durationInSeconds;
int orderNumber;
int workoutId;
int exerciseId;
WorkoutSearchRequest workout;
ExerciseSearchRequest exercise;
WorkoutSessionSearchRequest workoutSessions;
bool includeWorkout;
bool includeExercise;
bool includeWorkoutSessions;

Pagination pagination;

WorkoutExerciseSearchRequest({
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
this.includeWorkout,
this.includeExercise,
this.includeWorkoutSessions,
this.pagination,
}){
pagination ??= Pagination();
}

WorkoutExerciseSearchRequest copyWith({
int id,
int numberOfRepetitions,
int numberOfCalories,
int durationInSeconds,
int orderNumber,
int workoutId,
int exerciseId,
WorkoutSearchRequest workout,
ExerciseSearchRequest exercise,
WorkoutSessionSearchRequest workoutSessions,
bool includeWorkout,
bool includeExercise,
bool includeWorkoutSessions,
Pagination pagination,
}) {
return WorkoutExerciseSearchRequest(
id: id ?? this.id,
numberOfRepetitions: numberOfRepetitions ?? this.numberOfRepetitions,
numberOfCalories: numberOfCalories ?? this.numberOfCalories,
durationInSeconds: durationInSeconds ?? this.durationInSeconds,
orderNumber: orderNumber ?? this.orderNumber,
workoutId: workoutId ?? this.workoutId,
exerciseId: exerciseId ?? this.exerciseId,
workout: workout ?? this.workout,
exercise: exercise ?? this.exercise,
workoutSessions: workoutSessions ?? this.workoutSessions,
includeWorkout: includeWorkout ?? this.includeWorkout,
includeExercise: includeExercise ?? this.includeExercise,
includeWorkoutSessions: includeWorkoutSessions ?? this.includeWorkoutSessions,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'numberOfRepetitions':numberOfRepetitions,
'numberOfCalories':numberOfCalories,
'durationInSeconds':durationInSeconds,
'orderNumber':orderNumber,
'workoutId':workoutId,
'exerciseId':exerciseId,
'workout':workout?.toJson(),
'exercise':exercise?.toJson(),
'workoutSessions':workoutSessions?.toJson(),
'includeWorkout':includeWorkout,
'includeExercise':includeExercise,
'includeWorkoutSessions':includeWorkoutSessions,
'pagination': pagination?.toJson(),};
}

}