import 'user.dart';

class UserSession {
int id;
String tokenCreatedAt;
String ipAddress;
String deviceName;
double latitude;
double longitude;
bool shouldRegenerateToken;
bool isActive;
int userId;
User user;

UserSession({
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
});

factory UserSession.fromJson(Map<String, dynamic> json){
if (json != null) {
return UserSession(
id: json['id'],
tokenCreatedAt: json['tokenCreatedAt'],
ipAddress: json['ipAddress'],
deviceName: json['deviceName'],
latitude: json['latitude'],
longitude: json['longitude'],
shouldRegenerateToken: json['shouldRegenerateToken'],
isActive: json['isActive'],
userId: json['userId'],
user: User.fromJson(json['user']),
);
}
return null;
}

}