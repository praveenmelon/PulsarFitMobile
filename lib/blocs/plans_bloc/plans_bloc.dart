import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pulsar_fit/models/search_requests/plan_search_request.dart';
import 'package:pulsar_fit/models/search_requests/trainer_search_request.dart';
import 'package:pulsar_fit/models/search_requests/user_search_request.dart';

import 'package:pulsar_fit/repositories/plans_repository.dart';

import 'bloc.dart';

class PlansBloc extends Bloc<PlansEvent, PlansState> {
  final PlansRepository plansRepository;

  PlansBloc({
    @required this.plansRepository,
  })  : assert(plansRepository != null),
        super(_initialState);

  static PlansState get _initialState => LoadingPlansState(
        planSearchRequest: PlanSearchRequest(
          isPublic: true,
          includeTrainer: true,
          includeMultimediaFile: true,
          includePlanTags: true,
          includePlanResults: true,
          trainer: TrainerSearchRequest(
            includeUser: true,
            user: UserSearchRequest(
              includeMultimediaFile: true,
            ),
          ),
        ),
      );

  @override
  Stream<PlansState> mapEventToState(PlansEvent event) async* {
    if (event is LoadPlansEvent) {
      yield* _load();
    }
    if (event is LoadMorePlansEvent) {
      yield* _loadMore();
    }
    if (event is RefreshPlansEvent) {
      yield* _refresh();
    }
    if (event is SearchPlansEvent) {
      yield* _search(event);
    }
    if (event is ClearFiltersPlansEvent) {
      yield* _clearFilters();
    }
  }

  Stream<PlansState> _load() async* {
    yield LoadingPlansState(
      planSearchRequest: state.planSearchRequest,
    );

    final plans = await plansRepository.get(state.planSearchRequest);

    yield LoadedPlansState(
      plans: plans,
      planSearchRequest: state.planSearchRequest,
    );
  }

  Stream<PlansState> _loadMore() async* {
    var currentPlans = state.plans;
    state.planSearchRequest.pagination.increment();

    final plans = await plansRepository.get(state.planSearchRequest);

    if (plans?.isNotEmpty ?? false) {
      currentPlans.addAll(plans);
    }

    yield LoadedPlansState(
      plans: currentPlans,
      planSearchRequest: state.planSearchRequest,
    );
  }

  Stream<PlansState> _refresh() async* {
    state.planSearchRequest.pagination.reset();

    final plans = await plansRepository.get(state.planSearchRequest);
    yield LoadedPlansState(
      plans: plans,
      planSearchRequest: state.planSearchRequest,
    );
  }

  Stream<PlansState> _search(SearchPlansEvent event) async* {
    yield LoadingPlansState(
      planSearchRequest: event.planSearchRequest,
    );

    final plans = await plansRepository.get(event.planSearchRequest);

    yield LoadedPlansState(
      plans: plans,
      planSearchRequest: event.planSearchRequest,
    );
  }

  Stream<PlansState> _clearFilters() async* {
    yield LoadingPlansState(
      planSearchRequest: _initialState.planSearchRequest,
    );

    final plans = await plansRepository.get(_initialState.planSearchRequest);

    yield LoadedPlansState(
      plans: plans,
      planSearchRequest: _initialState.planSearchRequest,
    );
  }
}
