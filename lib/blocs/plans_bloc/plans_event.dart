import 'package:flutter/material.dart';
import 'package:pulsar_fit/models/search_requests/plan_search_request.dart';

abstract class PlansEvent {}

class LoadPlansEvent extends PlansEvent {}

class LoadMorePlansEvent extends PlansEvent {}

class RefreshPlansEvent extends PlansEvent {}

class SearchPlansEvent extends PlansEvent {
  final PlanSearchRequest planSearchRequest;

  SearchPlansEvent({
    @required this.planSearchRequest,
  }) : assert(planSearchRequest != null);
}

class ClearFiltersPlansEvent extends PlansEvent {}
