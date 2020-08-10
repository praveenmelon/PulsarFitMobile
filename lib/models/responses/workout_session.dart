import 'user.dart';
import 'workout_exercise.dart';

class WorkoutSession {
int id;
String start;
String end;
int userId;
int workoutExerciseId;
User user;
WorkoutExercise workoutExercise;

WorkoutSession({
this.id,
this.start,
this.end,
this.userId,
this.workoutExerciseId,
this.user,
this.workoutExercise,
});

factory WorkoutSession.fromJson(Map<String, dynamic> json){
if (json != null) {
return WorkoutSession(
id: json['id'],
start: json['start'],
end: json['end'],
userId: json['userId'],
workoutExerciseId: json['workoutExerciseId'],
user: User.fromJson(json['user']),
workoutExercise: WorkoutExercise.fromJson(json['workoutExercise']),
);
}
return null;
}

}