import 'package:flutter/material.dart';

abstract class PlanDetailsEvent {}

class LoadPlanDetailsEvent extends PlanDetailsEvent {
  int id;

  LoadPlanDetailsEvent({@required this.id}) : assert(id != null);
}
