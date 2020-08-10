import 'role_functionality_search_request.dart';
import 'pagination.dart';

class FunctionalitySearchRequest {
int id;
String assembly;
String controller;
String action;
RoleFunctionalitySearchRequest roleFunctionalities;
bool includeRoleFunctionalities;

Pagination pagination;

FunctionalitySearchRequest({
this.id,
this.assembly,
this.controller,
this.action,
this.roleFunctionalities,
this.includeRoleFunctionalities,
this.pagination,
}){
pagination ??= Pagination();
}

FunctionalitySearchRequest copyWith({
int id,
String assembly,
String controller,
String action,
RoleFunctionalitySearchRequest roleFunctionalities,
bool includeRoleFunctionalities,
Pagination pagination,
}) {
return FunctionalitySearchRequest(
id: id ?? this.id,
assembly: assembly ?? this.assembly,
controller: controller ?? this.controller,
action: action ?? this.action,
roleFunctionalities: roleFunctionalities ?? this.roleFunctionalities,
includeRoleFunctionalities: includeRoleFunctionalities ?? this.includeRoleFunctionalities,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'assembly':assembly,
'controller':controller,
'action':action,
'roleFunctionalities':roleFunctionalities?.toJson(),
'includeRoleFunctionalities':includeRoleFunctionalities,
'pagination': pagination?.toJson(),};
}

}