import '../enumerations/plan_level.dart';
import '../enumerations/strength_level.dart';
import '../enumerations/cardio_level.dart';
import 'trainer_search_request.dart';
import 'multimedia_file_search_request.dart';
import 'client_plan_search_request.dart';
import 'plan_workout_search_request.dart';
import 'plan_tag_search_request.dart';
import 'plan_result_search_request.dart';
import 'pagination.dart';

class PlanSearchRequest {
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
  TrainerSearchRequest trainer;
  MultimediaFileSearchRequest multimediaFile;
  ClientPlanSearchRequest clientPlans;
  PlanWorkoutSearchRequest planWorkouts;
  PlanTagSearchRequest planTags;
  PlanResultSearchRequest planResults;
  bool includeTrainer;
  bool includeMultimediaFile;
  bool includeClientPlans;
  bool includePlanWorkouts;
  bool includePlanTags;
  bool includePlanResults;

  Pagination pagination;

  PlanSearchRequest({
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
    this.includeTrainer,
    this.includeMultimediaFile,
    this.includeClientPlans,
    this.includePlanWorkouts,
    this.includePlanTags,
    this.includePlanResults,
    this.pagination,
  }) {
    pagination ??= Pagination();
  }

  PlanSearchRequest copyWith({
    int id,
    String name,
    String description,
    PlanLevel planLevel,
    StrengthLevel strengthLevel,
    CardioLevel cardioLevel,
    double price,
    bool isPublic,
    int trainerId,
    int multimediaFileId,
    TrainerSearchRequest trainer,
    MultimediaFileSearchRequest multimediaFile,
    ClientPlanSearchRequest clientPlans,
    PlanWorkoutSearchRequest planWorkouts,
    PlanTagSearchRequest planTags,
    PlanResultSearchRequest planResults,
    bool includeTrainer,
    bool includeMultimediaFile,
    bool includeClientPlans,
    bool includePlanWorkouts,
    bool includePlanTags,
    bool includePlanResults,
    Pagination pagination,
  }) {
    return PlanSearchRequest(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      planLevel: planLevel ?? this.planLevel,
      strengthLevel: strengthLevel ?? this.strengthLevel,
      cardioLevel: cardioLevel ?? this.cardioLevel,
      price: price ?? this.price,
      isPublic: isPublic ?? this.isPublic,
      trainerId: trainerId ?? this.trainerId,
      multimediaFileId: multimediaFileId ?? this.multimediaFileId,
      trainer: trainer ?? this.trainer,
      multimediaFile: multimediaFile ?? this.multimediaFile,
      clientPlans: clientPlans ?? this.clientPlans,
      planWorkouts: planWorkouts ?? this.planWorkouts,
      planTags: planTags ?? this.planTags,
      planResults: planResults ?? this.planResults,
      includeTrainer: includeTrainer ?? this.includeTrainer,
      includeMultimediaFile: includeMultimediaFile ?? this.includeMultimediaFile,
      includeClientPlans: includeClientPlans ?? this.includeClientPlans,
      includePlanWorkouts: includePlanWorkouts ?? this.includePlanWorkouts,
      includePlanTags: includePlanTags ?? this.includePlanTags,
      includePlanResults: includePlanResults ?? this.includePlanResults,
      pagination: pagination ?? this.pagination,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'planLevel': planLevel?.index,
      'strengthLevel': strengthLevel?.index,
      'cardioLevel': cardioLevel?.index,
      'price': price,
      'isPublic': isPublic,
      'trainerId': trainerId,
      'multimediaFileId': multimediaFileId,
      'trainer': trainer?.toJson(),
      'multimediaFile': multimediaFile?.toJson(),
      'clientPlans': clientPlans?.toJson(),
      'planWorkouts': planWorkouts?.toJson(),
      'planTags': planTags?.toJson(),
      'planResults': planResults?.toJson(),
      'includeTrainer': includeTrainer,
      'includeMultimediaFile': includeMultimediaFile,
      'includeClientPlans': includeClientPlans,
      'includePlanWorkouts': includePlanWorkouts,
      'includePlanTags': includePlanTags,
      'includePlanResults': includePlanResults,
      'pagination': pagination?.toJson(),
    };
  }
}
