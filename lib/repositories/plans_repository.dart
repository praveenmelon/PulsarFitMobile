import 'package:meta/meta.dart';
import 'package:pulsar_fit/data_providers/plans_data_provider.dart';
import 'package:pulsar_fit/models/responses/plan.dart';
import 'package:pulsar_fit/models/search_requests/plan_search_request.dart';

class PlansRepository {
  final PlansDataProvider apiDataProvider;

  PlansRepository({
    @required this.apiDataProvider,
  }) : assert(apiDataProvider != null);

  Future<List<Plan>> get(PlanSearchRequest request) async {
    try {
      return apiDataProvider.get(request);
    } catch (e) {
      //Return cached version (maybe)
      return null;
    }
  }

  Future<Plan> getById(int id, PlanSearchRequest request) async {
    try {
      return apiDataProvider.getById(id, request);
    } catch (e) {
      //Return cached version (maybe)
      return null;
    }
  }
}
