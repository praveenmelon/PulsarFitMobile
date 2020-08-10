import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pulsar_fit/models/search_requests/exercise_search_request.dart';
import 'package:pulsar_fit/models/search_requests/workout_exercise_search_request.dart';
import 'package:pulsar_fit/models/search_requests/workout_search_request.dart';

import 'package:pulsar_fit/repositories/workouts_repository.dart';

import 'bloc.dart';

class WorkoutDetailsBloc extends Bloc<WorkoutDetailsEvent, WorkoutDetailsState> {
  final WorkoutsRepository workoutsRepository;

  WorkoutDetailsBloc({
    @required this.workoutsRepository,
  })  : assert(workoutsRepository != null),
        super(LoadingWorkoutDetailsState());

  @override
  Stream<WorkoutDetailsState> mapEventToState(WorkoutDetailsEvent event) async* {
    if (event is LoadWorkoutDetailsEvent) {
      yield* _load(event);
    }
  }

  Stream<WorkoutDetailsState> _load(LoadWorkoutDetailsEvent event) async* {
    yield LoadingWorkoutDetailsState();

    final workout = await workoutsRepository.getById(
      event.id,
      WorkoutSearchRequest(
        includeWorkoutExercises: true,
        workoutExercises: WorkoutExerciseSearchRequest(
          includeExercise: true,
          exercise: ExerciseSearchRequest(
            includeMultimediaFile: true,
          ),
        ),
      ),
    );

    yield LoadedWorkoutDetailsState(workout: workout);
  }
}
