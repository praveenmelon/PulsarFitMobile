import 'role_search_request.dart';
import 'functionality_search_request.dart';
import 'pagination.dart';

class RoleFunctionalitySearchRequest {
int id;
int roleId;
int functionalityId;
RoleSearchRequest role;
FunctionalitySearchRequest functionality;
bool includeRole;
bool includeFunctionality;

Pagination pagination;

RoleFunctionalitySearchRequest({
this.id,
this.roleId,
this.functionalityId,
this.role,
this.functionality,
this.includeRole,
this.includeFunctionality,
this.pagination,
}){
pagination ??= Pagination();
}

RoleFunctionalitySearchRequest copyWith({
int id,
int roleId,
int functionalityId,
RoleSearchRequest role,
FunctionalitySearchRequest functionality,
bool includeRole,
bool includeFunctionality,
Pagination pagination,
}) {
return RoleFunctionalitySearchRequest(
id: id ?? this.id,
roleId: roleId ?? this.roleId,
functionalityId: functionalityId ?? this.functionalityId,
role: role ?? this.role,
functionality: functionality ?? this.functionality,
includeRole: includeRole ?? this.includeRole,
includeFunctionality: includeFunctionality ?? this.includeFunctionality,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'roleId':roleId,
'functionalityId':functionalityId,
'role':role?.toJson(),
'functionality':functionality?.toJson(),
'includeRole':includeRole,
'includeFunctionality':includeFunctionality,
'pagination': pagination?.toJson(),};
}

}