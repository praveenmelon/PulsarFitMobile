import 'plan.dart';
import 'workout.dart';

class PlanWorkout {
int id;
int orderNumber;
int planId;
int workoutId;
Plan plan;
Workout workout;

PlanWorkout({
this.id,
this.orderNumber,
this.planId,
this.workoutId,
this.plan,
this.workout,
});

factory PlanWorkout.fromJson(Map<String, dynamic> json){
if (json != null) {
return PlanWorkout(
id: json['id'],
orderNumber: json['orderNumber'],
planId: json['planId'],
workoutId: json['workoutId'],
plan: Plan.fromJson(json['plan']),
workout: Workout.fromJson(json['workout']),
);
}
return null;
}

}