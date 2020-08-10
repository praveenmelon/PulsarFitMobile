import 'exercise_search_request.dart';
import 'pagination.dart';

class ExerciseCategorySearchRequest {
int id;
String name;
ExerciseSearchRequest exercises;
bool includeExercises;

Pagination pagination;

ExerciseCategorySearchRequest({
this.id,
this.name,
this.exercises,
this.includeExercises,
this.pagination,
}){
pagination ??= Pagination();
}

ExerciseCategorySearchRequest copyWith({
int id,
String name,
ExerciseSearchRequest exercises,
bool includeExercises,
Pagination pagination,
}) {
return ExerciseCategorySearchRequest(
id: id ?? this.id,
name: name ?? this.name,
exercises: exercises ?? this.exercises,
includeExercises: includeExercises ?? this.includeExercises,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'name':name,
'exercises':exercises?.toJson(),
'includeExercises':includeExercises,
'pagination': pagination?.toJson(),};
}

}