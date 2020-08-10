import 'plan_search_request.dart';
import 'pagination.dart';

class PlanResultSearchRequest {
  int id;
  String name;
  int planId;
  PlanSearchRequest plan;
  bool includePlan;

  Pagination pagination;

  PlanResultSearchRequest({
    this.id,
    this.name,
    this.planId,
    this.plan,
    this.includePlan,
    this.pagination,
  }) {
    pagination ??= Pagination();
  }

  PlanResultSearchRequest copyWith({
    int id,
    String name,
    int planId,
    PlanSearchRequest plan,
    bool includePlan,
    Pagination pagination,
  }) {
    return PlanResultSearchRequest(
      id: id ?? this.id,
      name: name ?? this.name,
      planId: planId ?? this.planId,
      plan: plan ?? this.plan,
      includePlan: includePlan ?? this.includePlan,
      pagination: pagination ?? this.pagination,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'planId': planId,
      'plan': plan?.toJson(),
      'includePlan': includePlan,
      'pagination': pagination?.toJson(),
    };
  }
}
