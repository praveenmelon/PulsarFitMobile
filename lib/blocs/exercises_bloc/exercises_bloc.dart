import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pulsar_fit/models/search_requests/exercise_search_request.dart';

import 'package:pulsar_fit/repositories/exercises_repository.dart';

import 'bloc.dart';

class ExercisesBloc extends Bloc<ExercisesEvent, ExercisesState> {
  final ExercisesRepository exercisesRepository;

  ExercisesBloc({
    @required this.exercisesRepository,
  })  : assert(exercisesRepository != null),
        super(_initialState);

  static ExercisesState get _initialState => LoadingExercisesState(
        exerciseSearchRequest: ExerciseSearchRequest(
          isPublic: true,
          includeMultimediaFile: true,
        ),
      );

  @override
  Stream<ExercisesState> mapEventToState(ExercisesEvent event) async* {
    if (event is LoadExercisesEvent) {
      yield* _load();
    }
    if (event is LoadMoreExercisesEvent) {
      yield* _loadMore();
    }
    if (event is RefreshExercisesEvent) {
      yield* _refresh();
    }
    if (event is SearchExercisesEvent) {
      yield* _search(event);
    }
    if (event is ClearFiltersExercisesEvent) {
      yield* _clearFilters();
    }
  }

  Stream<ExercisesState> _load() async* {
    yield LoadingExercisesState(
      exerciseSearchRequest: state.exerciseSearchRequest,
    );

    final exercises = await exercisesRepository.get(state.exerciseSearchRequest);

    yield LoadedExercisesState(
      exercises: exercises,
      exerciseSearchRequest: state.exerciseSearchRequest,
    );
  }

  Stream<ExercisesState> _loadMore() async* {
    var currentExercises = state.exercises;
    state.exerciseSearchRequest.pagination.increment();

    final exercises = await exercisesRepository.get(state.exerciseSearchRequest);

    if (exercises?.isNotEmpty ?? false) {
      currentExercises.addAll(exercises);
    }

    yield LoadedExercisesState(
      exercises: currentExercises,
      exerciseSearchRequest: state.exerciseSearchRequest,
    );
  }

  Stream<ExercisesState> _refresh() async* {
    state.exerciseSearchRequest.pagination.reset();

    final exercises = await exercisesRepository.get(state.exerciseSearchRequest);

    yield LoadedExercisesState(
      exercises: exercises,
      exerciseSearchRequest: state.exerciseSearchRequest,
    );
  }

  Stream<ExercisesState> _search(SearchExercisesEvent event) async* {
    yield LoadingExercisesState(
      exerciseSearchRequest: event.exerciseSearchRequest,
    );

    final exercises = await exercisesRepository.get(event.exerciseSearchRequest);

    yield LoadedExercisesState(
      exercises: exercises,
      exerciseSearchRequest: event.exerciseSearchRequest,
    );
  }

  Stream<ExercisesState> _clearFilters() async* {
    yield LoadingExercisesState(
      exerciseSearchRequest: _initialState.exerciseSearchRequest,
    );

    final exercises = await exercisesRepository.get(_initialState.exerciseSearchRequest);

    yield LoadedExercisesState(
      exercises: exercises,
      exerciseSearchRequest: _initialState.exerciseSearchRequest,
    );
  }
}
