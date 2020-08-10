import 'user.dart';
import 'trainer.dart';
import 'client_plan.dart';

class Client {
int id;
double price;
String start;
String end;
bool active;
int userId;
int trainerId;
User user;
Trainer trainer;
List<ClientPlan> clientPlans;

Client({
this.id,
this.price,
this.start,
this.end,
this.active,
this.userId,
this.trainerId,
this.user,
this.trainer,
this.clientPlans,
});

factory Client.fromJson(Map<String, dynamic> json){
if (json != null) {
return Client(
id: json['id'],
price: json['price'],
start: json['start'],
end: json['end'],
active: json['active'],
userId: json['userId'],
trainerId: json['trainerId'],
user: User.fromJson(json['user']),
trainer: Trainer.fromJson(json['trainer']),
clientPlans: json['clientPlans']?.map<ClientPlan>((json) => ClientPlan.fromJson(json))?.toList(),
);
}
return null;
}

}