import 'client_search_request.dart';
import 'plan_search_request.dart';
import 'pagination.dart';

class ClientPlanSearchRequest {
int id;
double price;
double percentageFinished;
int clientId;
int planId;
ClientSearchRequest client;
PlanSearchRequest plan;
bool includeClient;
bool includePlan;

Pagination pagination;

ClientPlanSearchRequest({
this.id,
this.price,
this.percentageFinished,
this.clientId,
this.planId,
this.client,
this.plan,
this.includeClient,
this.includePlan,
this.pagination,
}){
pagination ??= Pagination();
}

ClientPlanSearchRequest copyWith({
int id,
double price,
double percentageFinished,
int clientId,
int planId,
ClientSearchRequest client,
PlanSearchRequest plan,
bool includeClient,
bool includePlan,
Pagination pagination,
}) {
return ClientPlanSearchRequest(
id: id ?? this.id,
price: price ?? this.price,
percentageFinished: percentageFinished ?? this.percentageFinished,
clientId: clientId ?? this.clientId,
planId: planId ?? this.planId,
client: client ?? this.client,
plan: plan ?? this.plan,
includeClient: includeClient ?? this.includeClient,
includePlan: includePlan ?? this.includePlan,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'price':price,
'percentageFinished':percentageFinished,
'clientId':clientId,
'planId':planId,
'client':client?.toJson(),
'plan':plan?.toJson(),
'includeClient':includeClient,
'includePlan':includePlan,
'pagination': pagination?.toJson(),};
}

}