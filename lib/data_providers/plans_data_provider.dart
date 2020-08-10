import 'dart:convert';

import 'package:pulsar_fit/common/extensions.dart';
import 'package:meta/meta.dart';
import 'package:pulsar_fit/common/api_client.dart';

import 'package:pulsar_fit/models/responses/plan.dart';
import 'package:pulsar_fit/models/search_requests/plan_search_request.dart';

class PlansDataProvider {
  final ApiClient apiClient;

  PlansDataProvider({
    @required this.apiClient,
  }) : assert(apiClient != null);

  Future<List<Plan>> get(PlanSearchRequest request) async {
    final response = await apiClient.get(
      '/Plans?${request.toJson().toQueryString()}',
    );

    if (response.statusCode != 200) {
      return null;
    }

    return json.decode(response.data).map<Plan>((json) => Plan.fromJson(json)).toList();
  }

  Future<Plan> getById(int id, PlanSearchRequest request) async {
    final response = await apiClient.get(
      '/Plans/${id}?${request.toJson().toQueryString()}',
    );

    if (response.statusCode != 200) {
      return null;
    }

    return Plan.fromJson(json.decode(response.data));
  }
}
