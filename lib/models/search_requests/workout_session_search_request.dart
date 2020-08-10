import 'user_search_request.dart';
import 'workout_exercise_search_request.dart';
import 'pagination.dart';

class WorkoutSessionSearchRequest {
int id;
String start;
String end;
int userId;
int workoutExerciseId;
UserSearchRequest user;
WorkoutExerciseSearchRequest workoutExercise;
bool includeUser;
bool includeWorkoutExercise;

Pagination pagination;

WorkoutSessionSearchRequest({
this.id,
this.start,
this.end,
this.userId,
this.workoutExerciseId,
this.user,
this.workoutExercise,
this.includeUser,
this.includeWorkoutExercise,
this.pagination,
}){
pagination ??= Pagination();
}

WorkoutSessionSearchRequest copyWith({
int id,
String start,
String end,
int userId,
int workoutExerciseId,
UserSearchRequest user,
WorkoutExerciseSearchRequest workoutExercise,
bool includeUser,
bool includeWorkoutExercise,
Pagination pagination,
}) {
return WorkoutSessionSearchRequest(
id: id ?? this.id,
start: start ?? this.start,
end: end ?? this.end,
userId: userId ?? this.userId,
workoutExerciseId: workoutExerciseId ?? this.workoutExerciseId,
user: user ?? this.user,
workoutExercise: workoutExercise ?? this.workoutExercise,
includeUser: includeUser ?? this.includeUser,
includeWorkoutExercise: includeWorkoutExercise ?? this.includeWorkoutExercise,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'start':start,
'end':end,
'userId':userId,
'workoutExerciseId':workoutExerciseId,
'user':user?.toJson(),
'workoutExercise':workoutExercise?.toJson(),
'includeUser':includeUser,
'includeWorkoutExercise':includeWorkoutExercise,
'pagination': pagination?.toJson(),};
}

}