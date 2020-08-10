import 'user.dart';
import 'role.dart';

class UserRole {
int id;
int userId;
int roleId;
User user;
Role role;

UserRole({
this.id,
this.userId,
this.roleId,
this.user,
this.role,
});

factory UserRole.fromJson(Map<String, dynamic> json){
if (json != null) {
return UserRole(
id: json['id'],
userId: json['userId'],
roleId: json['roleId'],
user: User.fromJson(json['user']),
role: Role.fromJson(json['role']),
);
}
return null;
}

}