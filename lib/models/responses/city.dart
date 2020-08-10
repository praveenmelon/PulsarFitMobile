import 'country.dart';
import 'user.dart';

class City {
int id;
String name;
double longitude;
double latitude;
int countryId;
Country country;
List<User> users;

City({
this.id,
this.name,
this.longitude,
this.latitude,
this.countryId,
this.country,
this.users,
});

factory City.fromJson(Map<String, dynamic> json){
if (json != null) {
return City(
id: json['id'],
name: json['name'],
longitude: json['longitude'],
latitude: json['latitude'],
countryId: json['countryId'],
country: Country.fromJson(json['country']),
users: json['users']?.map<User>((json) => User.fromJson(json))?.toList(),
);
}
return null;
}

}