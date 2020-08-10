import 'package:flutter/material.dart';
import 'package:pulsar_fit/models/responses/plan.dart';
import 'package:pulsar_fit/models/search_requests/plan_search_request.dart';

abstract class PlansState {
  List<Plan> plans;
  PlanSearchRequest planSearchRequest;
  bool get areFiltersSet => planSearchRequest.name?.isNotEmpty ?? false;

  PlansState({
    this.plans,
    @required this.planSearchRequest,
  }) : assert(planSearchRequest != null);
}

class LoadingPlansState extends PlansState {
  LoadingPlansState({
    @required PlanSearchRequest planSearchRequest,
  })  : assert(planSearchRequest != null),
        super(planSearchRequest: planSearchRequest);
}

class LoadedPlansState extends PlansState {
  LoadedPlansState({
    List<Plan> plans,
    @required PlanSearchRequest planSearchRequest,
  }) : super(
          plans: plans,
          planSearchRequest: planSearchRequest,
        );
}
