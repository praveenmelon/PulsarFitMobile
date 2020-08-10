import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pulsar_fit/models/search_requests/plan_search_request.dart';
import 'package:pulsar_fit/models/search_requests/plan_workout_search_request.dart';
import 'package:pulsar_fit/models/search_requests/workout_search_request.dart';

import 'package:pulsar_fit/repositories/plans_repository.dart';

import 'bloc.dart';

class PlanDetailsBloc extends Bloc<PlanDetailsEvent, PlanDetailsState> {
  final PlansRepository plansRepository;

  PlanDetailsBloc({
    @required this.plansRepository,
  })  : assert(plansRepository != null),
        super(LoadingPlanDetailsState());

  @override
  Stream<PlanDetailsState> mapEventToState(PlanDetailsEvent event) async* {
    if (event is LoadPlanDetailsEvent) {
      yield* _load(event);
    }
  }

  Stream<PlanDetailsState> _load(LoadPlanDetailsEvent event) async* {
    yield LoadingPlanDetailsState();

    final plan = await plansRepository.getById(
      event.id,
      PlanSearchRequest(
        includePlanWorkouts: true,
        planWorkouts: PlanWorkoutSearchRequest(
          includeWorkout: true,
          workout: WorkoutSearchRequest(
            includeMultimediaFile: true,
          ),
        ),
      ),
    );

    yield LoadedPlanDetailsState(plan: plan);
  }
}
