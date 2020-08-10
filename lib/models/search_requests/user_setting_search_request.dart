import 'user_search_request.dart';
import 'pagination.dart';

class UserSettingSearchRequest {
int id;
bool isProfilePublic;
bool isSidebarCollapsedWeb;
bool isTrialPeriodActive;
bool isGolderUser;
int userId;
UserSearchRequest user;
bool includeUser;

Pagination pagination;

UserSettingSearchRequest({
this.id,
this.isProfilePublic,
this.isSidebarCollapsedWeb,
this.isTrialPeriodActive,
this.isGolderUser,
this.userId,
this.user,
this.includeUser,
this.pagination,
}){
pagination ??= Pagination();
}

UserSettingSearchRequest copyWith({
int id,
bool isProfilePublic,
bool isSidebarCollapsedWeb,
bool isTrialPeriodActive,
bool isGolderUser,
int userId,
UserSearchRequest user,
bool includeUser,
Pagination pagination,
}) {
return UserSettingSearchRequest(
id: id ?? this.id,
isProfilePublic: isProfilePublic ?? this.isProfilePublic,
isSidebarCollapsedWeb: isSidebarCollapsedWeb ?? this.isSidebarCollapsedWeb,
isTrialPeriodActive: isTrialPeriodActive ?? this.isTrialPeriodActive,
isGolderUser: isGolderUser ?? this.isGolderUser,
userId: userId ?? this.userId,
user: user ?? this.user,
includeUser: includeUser ?? this.includeUser,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'isProfilePublic':isProfilePublic,
'isSidebarCollapsedWeb':isSidebarCollapsedWeb,
'isTrialPeriodActive':isTrialPeriodActive,
'isGolderUser':isGolderUser,
'userId':userId,
'user':user?.toJson(),
'includeUser':includeUser,
'pagination': pagination?.toJson(),};
}

}