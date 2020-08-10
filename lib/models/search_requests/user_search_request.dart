import '../enumerations/gender.dart';
import '../enumerations/user_type.dart';
import 'city_search_request.dart';
import 'multimedia_file_search_request.dart';
import 'user_setting_search_request.dart';
import 'trainer_search_request.dart';
import 'user_role_search_request.dart';
import 'client_search_request.dart';
import 'workout_session_search_request.dart';
import 'pagination.dart';

class UserSearchRequest {
int id;
String username;
String email;
String facebookId;
String firstName;
String lastName;
Gender gender;
UserType userType;
int cityId;
int multimediaFileId;
CitySearchRequest city;
MultimediaFileSearchRequest multimediaFile;
UserSettingSearchRequest userSetting;
TrainerSearchRequest trainer;
UserRoleSearchRequest userRoles;
ClientSearchRequest clients;
WorkoutSessionSearchRequest workoutSessions;
bool includeCity;
bool includeMultimediaFile;
bool includeUserSetting;
bool includeUserRoles;
bool includeClients;
bool includeWorkoutSessions;

Pagination pagination;

UserSearchRequest({
this.id,
this.username,
this.email,
this.facebookId,
this.firstName,
this.lastName,
this.gender,
this.userType,
this.cityId,
this.multimediaFileId,
this.city,
this.multimediaFile,
this.userSetting,
this.trainer,
this.userRoles,
this.clients,
this.workoutSessions,
this.includeCity,
this.includeMultimediaFile,
this.includeUserSetting,
this.includeUserRoles,
this.includeClients,
this.includeWorkoutSessions,
this.pagination,
}){
pagination ??= Pagination();
}

UserSearchRequest copyWith({
int id,
String username,
String email,
String facebookId,
String firstName,
String lastName,
Gender gender,
UserType userType,
int cityId,
int multimediaFileId,
CitySearchRequest city,
MultimediaFileSearchRequest multimediaFile,
UserSettingSearchRequest userSetting,
TrainerSearchRequest trainer,
UserRoleSearchRequest userRoles,
ClientSearchRequest clients,
WorkoutSessionSearchRequest workoutSessions,
bool includeCity,
bool includeMultimediaFile,
bool includeUserSetting,
bool includeUserRoles,
bool includeClients,
bool includeWorkoutSessions,
Pagination pagination,
}) {
return UserSearchRequest(
id: id ?? this.id,
username: username ?? this.username,
email: email ?? this.email,
facebookId: facebookId ?? this.facebookId,
firstName: firstName ?? this.firstName,
lastName: lastName ?? this.lastName,
gender: gender ?? this.gender,
userType: userType ?? this.userType,
cityId: cityId ?? this.cityId,
multimediaFileId: multimediaFileId ?? this.multimediaFileId,
city: city ?? this.city,
multimediaFile: multimediaFile ?? this.multimediaFile,
userSetting: userSetting ?? this.userSetting,
trainer: trainer ?? this.trainer,
userRoles: userRoles ?? this.userRoles,
clients: clients ?? this.clients,
workoutSessions: workoutSessions ?? this.workoutSessions,
includeCity: includeCity ?? this.includeCity,
includeMultimediaFile: includeMultimediaFile ?? this.includeMultimediaFile,
includeUserSetting: includeUserSetting ?? this.includeUserSetting,
includeUserRoles: includeUserRoles ?? this.includeUserRoles,
includeClients: includeClients ?? this.includeClients,
includeWorkoutSessions: includeWorkoutSessions ?? this.includeWorkoutSessions,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'username':username,
'email':email,
'facebookId':facebookId,
'firstName':firstName,
'lastName':lastName,
'gender':gender?.index,
'userType':userType?.index,
'cityId':cityId,
'multimediaFileId':multimediaFileId,
'city':city?.toJson(),
'multimediaFile':multimediaFile?.toJson(),
'userSetting':userSetting?.toJson(),
'trainer':trainer?.toJson(),
'userRoles':userRoles?.toJson(),
'clients':clients?.toJson(),
'workoutSessions':workoutSessions?.toJson(),
'includeCity':includeCity,
'includeMultimediaFile':includeMultimediaFile,
'includeUserSetting':includeUserSetting,
'includeUserRoles':includeUserRoles,
'includeClients':includeClients,
'includeWorkoutSessions':includeWorkoutSessions,
'pagination': pagination?.toJson(),};
}

}