import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pulsar_fit/models/search_requests/exercise_search_request.dart';
import 'package:pulsar_fit/models/search_requests/workout_exercise_search_request.dart';
import 'package:pulsar_fit/models/search_requests/workout_search_request.dart';

import 'package:pulsar_fit/repositories/workouts_repository.dart';

import 'bloc.dart';

class WorkoutsBloc extends Bloc<WorkoutsEvent, WorkoutsState> {
  final WorkoutsRepository workoutsRepository;

  WorkoutsBloc({
    @required this.workoutsRepository,
  })  : assert(workoutsRepository != null),
        super(_initialState);

  static WorkoutsState get _initialState => LoadingWorkoutsState(
        workoutSearchRequest: WorkoutSearchRequest(
          isPublic: true,
          includeMultimediaFile: true,
        ),
      );

  @override
  Stream<WorkoutsState> mapEventToState(WorkoutsEvent event) async* {
    if (event is LoadWorkoutsEvent) {
      yield* _load();
    }
    if (event is LoadMoreWorkoutsEvent) {
      yield* _loadMore();
    }
    if (event is RefreshWorkoutsEvent) {
      yield* _refresh();
    }
    if (event is SearchWorkoutsEvent) {
      yield* _search(event);
    }
    if (event is ClearFiltersWorkoutsEvent) {
      yield* _clearFilters();
    }
  }

  Stream<WorkoutsState> _load() async* {
    yield LoadingWorkoutsState(
      workoutSearchRequest: state.workoutSearchRequest,
    );

    final workouts = await workoutsRepository.get(state.workoutSearchRequest);

    yield LoadedWorkoutsState(
      workouts: workouts,
      workoutSearchRequest: state.workoutSearchRequest,
    );
  }

  Stream<WorkoutsState> _loadMore() async* {
    var currentWorkouts = state.workouts;
    state.workoutSearchRequest.pagination.increment();

    final workouts = await workoutsRepository.get(state.workoutSearchRequest);

    if (workouts?.isNotEmpty ?? false) {
      currentWorkouts.addAll(workouts);
    }

    yield LoadedWorkoutsState(
      workouts: currentWorkouts,
      workoutSearchRequest: state.workoutSearchRequest,
    );
  }

  Stream<WorkoutsState> _refresh() async* {
    state.workoutSearchRequest.pagination.reset();

    final workouts = await workoutsRepository.get(state.workoutSearchRequest);

    yield LoadedWorkoutsState(
      workouts: workouts,
      workoutSearchRequest: state.workoutSearchRequest,
    );
  }

  Stream<WorkoutsState> _search(SearchWorkoutsEvent event) async* {
    yield LoadingWorkoutsState(
      workoutSearchRequest: event.workoutSearchRequest,
    );

    final workouts = await workoutsRepository.get(event.workoutSearchRequest);

    yield LoadedWorkoutsState(
      workouts: workouts,
      workoutSearchRequest: event.workoutSearchRequest,
    );
  }

  Stream<WorkoutsState> _clearFilters() async* {
    yield LoadingWorkoutsState(
      workoutSearchRequest: _initialState.workoutSearchRequest,
    );

    final workouts = await workoutsRepository.get(_initialState.workoutSearchRequest);

    yield LoadedWorkoutsState(
      workouts: workouts,
      workoutSearchRequest: _initialState.workoutSearchRequest,
    );
  }
}
