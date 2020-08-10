import 'exercise.dart';

class ExerciseCategory {
int id;
String name;
List<Exercise> exercises;

ExerciseCategory({
this.id,
this.name,
this.exercises,
});

factory ExerciseCategory.fromJson(Map<String, dynamic> json){
if (json != null) {
return ExerciseCategory(
id: json['id'],
name: json['name'],
exercises: json['exercises']?.map<Exercise>((json) => Exercise.fromJson(json))?.toList(),
);
}
return null;
}

}