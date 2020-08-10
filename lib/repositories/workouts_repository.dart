import 'package:meta/meta.dart';
import 'package:pulsar_fit/data_providers/workouts_data_provider.dart';
import 'package:pulsar_fit/models/responses/workout.dart';
import 'package:pulsar_fit/models/search_requests/workout_search_request.dart';

class WorkoutsRepository {
  final WorkoutsDataProvider apiDataProvider;

  WorkoutsRepository({
    @required this.apiDataProvider,
  }) : assert(apiDataProvider != null);

  Future<List<Workout>> get(WorkoutSearchRequest request) async {
    try {
      return apiDataProvider.get(request);
    } catch (e) {
      //Return cached version (maybe)
      return null;
    }
  }

  Future<Workout> getById(int id, WorkoutSearchRequest request) async {
    try {
      return apiDataProvider.getById(id, request);
    } catch (e) {
      //Return cached version (maybe)
      return null;
    }
  }
}
