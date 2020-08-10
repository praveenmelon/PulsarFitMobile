import '../enumerations/plan_level.dart';
import '../enumerations/strength_level.dart';
import '../enumerations/cardio_level.dart';
import 'trainer.dart';
import 'multimedia_file.dart';
import 'client_plan.dart';
import 'plan_workout.dart';
import 'plan_tag.dart';
import 'plan_result.dart';

class Plan {
  int id;
  String name;
  String description;
  PlanLevel planLevel;
  StrengthLevel strengthLevel;
  CardioLevel cardioLevel;
  double price;
  bool isPublic;
  int trainerId;
  int multimediaFileId;
  Trainer trainer;
  MultimediaFile multimediaFile;
  List<ClientPlan> clientPlans;
  List<PlanWorkout> planWorkouts;
  List<PlanTag> planTags;
  List<PlanResult> planResults;

  Plan({
    this.id,
    this.name,
    this.description,
    this.planLevel,
    this.strengthLevel,
    this.cardioLevel,
    this.price,
    this.isPublic,
    this.trainerId,
    this.multimediaFileId,
    this.trainer,
    this.multimediaFile,
    this.clientPlans,
    this.planWorkouts,
    this.planTags,
    this.planResults,
  });

  factory Plan.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return Plan(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        planLevel: PlanLevel.getValue(json['planLevel']),
        strengthLevel: StrengthLevel.getValue(json['strengthLevel']),
        cardioLevel: CardioLevel.getValue(json['cardioLevel']),
        price: json['price'],
        isPublic: json['isPublic'],
        trainerId: json['trainerId'],
        multimediaFileId: json['multimediaFileId'],
        trainer: Trainer.fromJson(json['trainer']),
        multimediaFile: MultimediaFile.fromJson(json['multimediaFile']),
        clientPlans: json['clientPlans']?.map<ClientPlan>((json) => ClientPlan.fromJson(json))?.toList(),
        planWorkouts: json['planWorkouts']?.map<PlanWorkout>((json) => PlanWorkout.fromJson(json))?.toList(),
        planTags: json['planTags']?.map<PlanTag>((json) => PlanTag.fromJson(json))?.toList(),
        planResults: json['planResults']?.map<PlanResult>((json) => PlanResult.fromJson(json))?.toList(),
      );
    }
    return null;
  }
}
