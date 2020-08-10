import 'plan.dart';

class PlanResult {
int id;
String name;
int planId;
Plan plan;

PlanResult({
this.id,
this.name,
this.planId,
this.plan,
});

factory PlanResult.fromJson(Map<String, dynamic> json){
if (json != null) {
return PlanResult(
id: json['id'],
name: json['name'],
planId: json['planId'],
plan: Plan.fromJson(json['plan']),
);
}
return null;
}

}