import 'user_search_request.dart';
import 'client_search_request.dart';
import 'exercise_search_request.dart';
import 'plan_search_request.dart';
import 'pagination.dart';

class TrainerSearchRequest {
int id;
String licenseNumber;
int userId;
UserSearchRequest user;
ClientSearchRequest clients;
ExerciseSearchRequest exercises;
PlanSearchRequest plans;
bool includeUser;
bool includeClients;
bool includeExercises;
bool includePlans;

Pagination pagination;

TrainerSearchRequest({
this.id,
this.licenseNumber,
this.userId,
this.user,
this.clients,
this.exercises,
this.plans,
this.includeUser,
this.includeClients,
this.includeExercises,
this.includePlans,
this.pagination,
}){
pagination ??= Pagination();
}

TrainerSearchRequest copyWith({
int id,
String licenseNumber,
int userId,
UserSearchRequest user,
ClientSearchRequest clients,
ExerciseSearchRequest exercises,
PlanSearchRequest plans,
bool includeUser,
bool includeClients,
bool includeExercises,
bool includePlans,
Pagination pagination,
}) {
return TrainerSearchRequest(
id: id ?? this.id,
licenseNumber: licenseNumber ?? this.licenseNumber,
userId: userId ?? this.userId,
user: user ?? this.user,
clients: clients ?? this.clients,
exercises: exercises ?? this.exercises,
plans: plans ?? this.plans,
includeUser: includeUser ?? this.includeUser,
includeClients: includeClients ?? this.includeClients,
includeExercises: includeExercises ?? this.includeExercises,
includePlans: includePlans ?? this.includePlans,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'licenseNumber':licenseNumber,
'userId':userId,
'user':user?.toJson(),
'clients':clients?.toJson(),
'exercises':exercises?.toJson(),
'plans':plans?.toJson(),
'includeUser':includeUser,
'includeClients':includeClients,
'includeExercises':includeExercises,
'includePlans':includePlans,
'pagination': pagination?.toJson(),};
}

}