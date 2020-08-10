import 'package:pulsar_fit/models/responses/plan.dart';

abstract class PlanDetailsState {}

class LoadingPlanDetailsState extends PlanDetailsState {}

class LoadedPlanDetailsState extends PlanDetailsState {
  Plan plan;
  LoadedPlanDetailsState({this.plan});
}
