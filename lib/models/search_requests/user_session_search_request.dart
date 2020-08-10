import 'user_search_request.dart';
import 'pagination.dart';

class UserSessionSearchRequest {
int id;
String tokenCreatedAt;
String ipAddress;
String deviceName;
double latitude;
double longitude;
bool shouldRegenerateToken;
bool isActive;
int userId;
UserSearchRequest user;
bool includeUser;

Pagination pagination;

UserSessionSearchRequest({
this.id,
this.tokenCreatedAt,
this.ipAddress,
this.deviceName,
this.latitude,
this.longitude,
this.shouldRegenerateToken,
this.isActive,
this.userId,
this.user,
this.includeUser,
this.pagination,
}){
pagination ??= Pagination();
}

UserSessionSearchRequest copyWith({
int id,
String tokenCreatedAt,
String ipAddress,
String deviceName,
double latitude,
double longitude,
bool shouldRegenerateToken,
bool isActive,
int userId,
UserSearchRequest user,
bool includeUser,
Pagination pagination,
}) {
return UserSessionSearchRequest(
id: id ?? this.id,
tokenCreatedAt: tokenCreatedAt ?? this.tokenCreatedAt,
ipAddress: ipAddress ?? this.ipAddress,
deviceName: deviceName ?? this.deviceName,
latitude: latitude ?? this.latitude,
longitude: longitude ?? this.longitude,
shouldRegenerateToken: shouldRegenerateToken ?? this.shouldRegenerateToken,
isActive: isActive ?? this.isActive,
userId: userId ?? this.userId,
user: user ?? this.user,
includeUser: includeUser ?? this.includeUser,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'tokenCreatedAt':tokenCreatedAt,
'ipAddress':ipAddress,
'deviceName':deviceName,
'latitude':latitude,
'longitude':longitude,
'shouldRegenerateToken':shouldRegenerateToken,
'isActive':isActive,
'userId':userId,
'user':user?.toJson(),
'includeUser':includeUser,
'pagination': pagination?.toJson(),};
}

}