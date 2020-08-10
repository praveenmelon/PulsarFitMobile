import 'user.dart';

class UserSetting {
int id;
bool isProfilePublic;
bool isSidebarCollapsedWeb;
bool isTrialPeriodActive;
bool isGolderUser;
int userId;
User user;

UserSetting({
this.id,
this.isProfilePublic,
this.isSidebarCollapsedWeb,
this.isTrialPeriodActive,
this.isGolderUser,
this.userId,
this.user,
});

factory UserSetting.fromJson(Map<String, dynamic> json){
if (json != null) {
return UserSetting(
id: json['id'],
isProfilePublic: json['isProfilePublic'],
isSidebarCollapsedWeb: json['isSidebarCollapsedWeb'],
isTrialPeriodActive: json['isTrialPeriodActive'],
isGolderUser: json['isGolderUser'],
userId: json['userId'],
user: User.fromJson(json['user']),
);
}
return null;
}

}