import 'dart:convert';

import 'package:pulsar_fit/common/extensions.dart';
import 'package:meta/meta.dart';
import 'package:pulsar_fit/common/api_client.dart';

import 'package:pulsar_fit/models/responses/workout.dart';
import 'package:pulsar_fit/models/search_requests/workout_search_request.dart';

class WorkoutsDataProvider {
  final ApiClient apiClient;

  WorkoutsDataProvider({
    @required this.apiClient,
  }) : assert(apiClient != null);

  Future<List<Workout>> get(WorkoutSearchRequest request) async {
    final response = await apiClient.get(
      '/Workouts?${request.toJson().toQueryString()}',
    );

    if (response.statusCode != 200) {
      return null;
    }

    return json.decode(response.data).map<Workout>((json) => Workout.fromJson(json)).toList();
  }

  Future<Workout> getById(int id, WorkoutSearchRequest request) async {
    final response = await apiClient.get(
      '/Workouts/${id}?${request.toJson().toQueryString()}',
    );

    if (response.statusCode != 200) {
      return null;
    }

    return Workout.fromJson(json.decode(response.data));
  }
}
