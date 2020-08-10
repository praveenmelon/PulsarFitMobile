import 'user.dart';
import 'client.dart';
import 'exercise.dart';
import 'plan.dart';

class Trainer {
int id;
String licenseNumber;
int userId;
User user;
List<Client> clients;
List<Exercise> exercises;
List<Plan> plans;

Trainer({
this.id,
this.licenseNumber,
this.userId,
this.user,
this.clients,
this.exercises,
this.plans,
});

factory Trainer.fromJson(Map<String, dynamic> json){
if (json != null) {
return Trainer(
id: json['id'],
licenseNumber: json['licenseNumber'],
userId: json['userId'],
user: User.fromJson(json['user']),
clients: json['clients']?.map<Client>((json) => Client.fromJson(json))?.toList(),
exercises: json['exercises']?.map<Exercise>((json) => Exercise.fromJson(json))?.toList(),
plans: json['plans']?.map<Plan>((json) => Plan.fromJson(json))?.toList(),
);
}
return null;
}

}