import 'role.dart';
import 'functionality.dart';

class RoleFunctionality {
int id;
int roleId;
int functionalityId;
Role role;
Functionality functionality;

RoleFunctionality({
this.id,
this.roleId,
this.functionalityId,
this.role,
this.functionality,
});

factory RoleFunctionality.fromJson(Map<String, dynamic> json){
if (json != null) {
return RoleFunctionality(
id: json['id'],
roleId: json['roleId'],
functionalityId: json['functionalityId'],
role: Role.fromJson(json['role']),
functionality: Functionality.fromJson(json['functionality']),
);
}
return null;
}

}