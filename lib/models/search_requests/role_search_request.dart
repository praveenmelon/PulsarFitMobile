import 'pagination.dart';

class RoleSearchRequest {
int id;
String name;
String description;
bool includeRoleFunctionalities;
bool includeUserRoles;

Pagination pagination;

RoleSearchRequest({
this.id,
this.name,
this.description,
this.includeRoleFunctionalities,
this.includeUserRoles,
this.pagination,
}){
pagination ??= Pagination();
}

RoleSearchRequest copyWith({
int id,
String name,
String description,
bool includeRoleFunctionalities,
bool includeUserRoles,
Pagination pagination,
}) {
return RoleSearchRequest(
id: id ?? this.id,
name: name ?? this.name,
description: description ?? this.description,
includeRoleFunctionalities: includeRoleFunctionalities ?? this.includeRoleFunctionalities,
includeUserRoles: includeUserRoles ?? this.includeUserRoles,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'name':name,
'description':description,
'includeRoleFunctionalities':includeRoleFunctionalities,
'includeUserRoles':includeUserRoles,
'pagination': pagination?.toJson(),};
}

}