import 'user_search_request.dart';
import 'trainer_search_request.dart';
import 'client_plan_search_request.dart';
import 'pagination.dart';

class ClientSearchRequest {
int id;
double price;
String start;
String end;
bool active;
int userId;
int trainerId;
UserSearchRequest user;
TrainerSearchRequest trainer;
ClientPlanSearchRequest clientPlans;
bool includeUser;
bool includeTrainer;
bool includeClientPlans;

Pagination pagination;

ClientSearchRequest({
this.id,
this.price,
this.start,
this.end,
this.active,
this.userId,
this.trainerId,
this.user,
this.trainer,
this.clientPlans,
this.includeUser,
this.includeTrainer,
this.includeClientPlans,
this.pagination,
}){
pagination ??= Pagination();
}

ClientSearchRequest copyWith({
int id,
double price,
String start,
String end,
bool active,
int userId,
int trainerId,
UserSearchRequest user,
TrainerSearchRequest trainer,
ClientPlanSearchRequest clientPlans,
bool includeUser,
bool includeTrainer,
bool includeClientPlans,
Pagination pagination,
}) {
return ClientSearchRequest(
id: id ?? this.id,
price: price ?? this.price,
start: start ?? this.start,
end: end ?? this.end,
active: active ?? this.active,
userId: userId ?? this.userId,
trainerId: trainerId ?? this.trainerId,
user: user ?? this.user,
trainer: trainer ?? this.trainer,
clientPlans: clientPlans ?? this.clientPlans,
includeUser: includeUser ?? this.includeUser,
includeTrainer: includeTrainer ?? this.includeTrainer,
includeClientPlans: includeClientPlans ?? this.includeClientPlans,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'price':price,
'start':start,
'end':end,
'active':active,
'userId':userId,
'trainerId':trainerId,
'user':user?.toJson(),
'trainer':trainer?.toJson(),
'clientPlans':clientPlans?.toJson(),
'includeUser':includeUser,
'includeTrainer':includeTrainer,
'includeClientPlans':includeClientPlans,
'pagination': pagination?.toJson(),};
}

}