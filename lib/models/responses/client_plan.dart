import 'client.dart';
import 'plan.dart';

class ClientPlan {
int id;
double price;
double percentageFinished;
int clientId;
int planId;
Client client;
Plan plan;

ClientPlan({
this.id,
this.price,
this.percentageFinished,
this.clientId,
this.planId,
this.client,
this.plan,
});

factory ClientPlan.fromJson(Map<String, dynamic> json){
if (json != null) {
return ClientPlan(
id: json['id'],
price: json['price'],
percentageFinished: json['percentageFinished'],
clientId: json['clientId'],
planId: json['planId'],
client: Client.fromJson(json['client']),
plan: Plan.fromJson(json['plan']),
);
}
return null;
}

}