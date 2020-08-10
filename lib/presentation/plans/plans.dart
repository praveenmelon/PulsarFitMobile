import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pulsar_fit/presentation/common/loader.dart';
import 'package:pulsar_fit/presentation/common/no_content.dart';
import 'package:pulsar_fit/presentation/plans/plan_list_tile.dart';
import 'package:pulsar_fit/blocs/plans_bloc/bloc.dart';
import 'package:pulsar_fit/common/extensions.dart';

class Plans extends StatefulWidget {
  @override
  _PlansState createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  final RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final plansBloc = context.bloc<PlansBloc>();

    return BlocBuilder<PlansBloc, PlansState>(
      builder: (context, state) {
        return SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          header: MaterialClassicHeader(
            color: context.theme().accentColor,
          ),
          footer: ClassicFooter(
            canLoadingText: context.localizer().translation.releaseToLoadMore,
            loadingText: context.localizer().translation.loading,
            idleText: context.localizer().translation.noMoreData,
          ),
          onRefresh: () async {
            plansBloc.add(RefreshPlansEvent());
          },
          onLoading: () async {
            plansBloc.add(LoadMorePlansEvent());
          },
          child: () {
            if (state is LoadingPlansState) {
              return Loader();
            }

            if (state is LoadedPlansState) {
              _refreshController.refreshCompleted();
              _refreshController.loadComplete();

              if (state.plans.isNullOrEmpty()) {
                return NoContent();
              }

              return ListView(
                cacheExtent: 100000,
                children: state.plans
                    .map<Widget>(
                      (x) => PlanListTile(plan: x),
                    )
                    .toList(),
              );
            }

            return NoContent();
          }(),
        );
      },
    );
  }
}
