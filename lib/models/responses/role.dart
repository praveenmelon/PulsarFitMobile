import 'role_functionality.dart';
import 'user_role.dart';

class Role {
int id;
String name;
String description;
List<RoleFunctionality> roleFunctionalities;
List<UserRole> userRoles;

Role({
this.id,
this.name,
this.description,
this.roleFunctionalities,
this.userRoles,
});

factory Role.fromJson(Map<String, dynamic> json){
if (json != null) {
return Role(
id: json['id'],
name: json['name'],
description: json['description'],
roleFunctionalities: json['roleFunctionalities']?.map<RoleFunctionality>((json) => RoleFunctionality.fromJson(json))?.toList(),
userRoles: json['userRoles']?.map<UserRole>((json) => UserRole.fromJson(json))?.toList(),
);
}
return null;
}

}