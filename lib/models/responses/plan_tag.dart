import 'plan.dart';

class PlanTag {
int id;
String name;
int planId;
Plan plan;

PlanTag({
this.id,
this.name,
this.planId,
this.plan,
});

factory PlanTag.fromJson(Map<String, dynamic> json){
if (json != null) {
return PlanTag(
id: json['id'],
name: json['name'],
planId: json['planId'],
plan: Plan.fromJson(json['plan']),
);
}
return null;
}

}