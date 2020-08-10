import 'plan_search_request.dart';
import 'workout_search_request.dart';
import 'pagination.dart';

class PlanWorkoutSearchRequest {
int id;
int orderNumber;
int planId;
int workoutId;
PlanSearchRequest plan;
WorkoutSearchRequest workout;
bool includePlan;
bool includeWorkout;

Pagination pagination;

PlanWorkoutSearchRequest({
this.id,
this.orderNumber,
this.planId,
this.workoutId,
this.plan,
this.workout,
this.includePlan,
this.includeWorkout,
this.pagination,
}){
pagination ??= Pagination();
}

PlanWorkoutSearchRequest copyWith({
int id,
int orderNumber,
int planId,
int workoutId,
PlanSearchRequest plan,
WorkoutSearchRequest workout,
bool includePlan,
bool includeWorkout,
Pagination pagination,
}) {
return PlanWorkoutSearchRequest(
id: id ?? this.id,
orderNumber: orderNumber ?? this.orderNumber,
planId: planId ?? this.planId,
workoutId: workoutId ?? this.workoutId,
plan: plan ?? this.plan,
workout: workout ?? this.workout,
includePlan: includePlan ?? this.includePlan,
includeWorkout: includeWorkout ?? this.includeWorkout,
pagination: pagination ?? this.pagination,
);
}

Map<String, dynamic> toJson(){
return {
'id':id,
'orderNumber':orderNumber,
'planId':planId,
'workoutId':workoutId,
'plan':plan?.toJson(),
'workout':workout?.toJson(),
'includePlan':includePlan,
'includeWorkout':includeWorkout,
'pagination': pagination?.toJson(),};
}

}