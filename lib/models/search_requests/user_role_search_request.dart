import 'user_search_request.dart';
import 'role_search_request.dart';
import 'pagination.dart';

class UserRoleSearchRequest {
int id;
int userId;
int roleId;
UserSearchRequest user;
RoleSearchRequest role;
bool includeUser;
bool includeRole;

Pagination pagination;

UserRoleSearchRequest({
this.id,
this.userId,
this.roleId,
this.user,
this.role,
this.includeUser,
this.includeRole,
this.pagination,
}){
pagination ??= Pagination();
}

UserRoleSearchRequest copyWith({
int id,
int userId,
int roleId,
UserSearchRequest user,
RoleSearchRequest role,
bool includeUser,
bool includeRole,
Pagination pagination,
}) {
return UserRoleSearchRequest(
id: id ?? this.id,
userId: userId ?? this.userId,
roleId: roleId ?? this.roleId,
user: user ?? this.user,
role: role ?? this.role,
includeUser: includeUser ?? this.includeUser,
includeRole: includeRole ?? this.includeRole,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'userId':userId,
'roleId':roleId,
'user':user?.toJson(),
'role':role?.toJson(),
'includeUser':includeUser,
'includeRole':includeRole,
'pagination': pagination?.toJson(),};
}

}