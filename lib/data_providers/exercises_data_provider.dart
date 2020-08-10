import 'dart:convert';

import 'package:pulsar_fit/common/extensions.dart';
import 'package:meta/meta.dart';
import 'package:pulsar_fit/common/api_client.dart';

import 'package:pulsar_fit/models/responses/exercise.dart';
import 'package:pulsar_fit/models/search_requests/exercise_search_request.dart';

class ExercisesDataProvider {
  final ApiClient apiClient;

  ExercisesDataProvider({
    @required this.apiClient,
  }) : assert(apiClient != null);

  Future<List<Exercise>> get(ExerciseSearchRequest request) async {
    final response = await apiClient.get(
      '/Exercises?${request.toJson().toQueryString()}',
    );

    if (response.statusCode != 200) {
      return null;
    }

    return json.decode(response.data).map<Exercise>((json) => Exercise.fromJson(json)).toList();
  }

  Future<Exercise> getById(int id, ExerciseSearchRequest request) async {
    final response = await apiClient.get(
      '/Exercises/${id}?${request.toJson().toQueryString()}',
    );

    if (response.statusCode != 200) {
      return null;
    }

    return Exercise.fromJson(json.decode(response.data));
  }
}
