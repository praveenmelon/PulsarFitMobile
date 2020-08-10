import 'package:meta/meta.dart';
import 'package:pulsar_fit/data_providers/exercises_data_provider.dart';
import 'package:pulsar_fit/models/responses/exercise.dart';
import 'package:pulsar_fit/models/search_requests/exercise_search_request.dart';

class ExercisesRepository {
  final ExercisesDataProvider apiDataProvider;

  ExercisesRepository({
    @required this.apiDataProvider,
  }) : assert(apiDataProvider != null);

  Future<List<Exercise>> get(ExerciseSearchRequest request) async {
    try {
      return apiDataProvider.get(request);
    } catch (e) {
      //Return cached version (maybe)
      return null;
    }
  }

  Future<Exercise> getById(int id, ExerciseSearchRequest request) async {
    try {
      return apiDataProvider.getById(id, request);
    } catch (e) {
      //Return cached version (maybe)
      return null;
    }
  }
}
