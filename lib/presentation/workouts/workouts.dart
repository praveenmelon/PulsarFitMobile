import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pulsar_fit/presentation/common/loader.dart';
import 'package:pulsar_fit/presentation/common/no_content.dart';
import 'package:pulsar_fit/presentation/workouts/workout_list_tile.dart';
import 'package:pulsar_fit/blocs/workouts_bloc/bloc.dart';
import 'package:pulsar_fit/common/extensions.dart';

class Workouts extends StatefulWidget {
  @override
  _WorkoutsState createState() => _WorkoutsState();
}

class _WorkoutsState extends State<Workouts> {
  final RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workoutsBloc = context.bloc<WorkoutsBloc>();

    return BlocBuilder<WorkoutsBloc, WorkoutsState>(
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
            workoutsBloc.add(RefreshWorkoutsEvent());
          },
          onLoading: () async {
            workoutsBloc.add(LoadMoreWorkoutsEvent());
          },
          child: () {
            if (state is LoadingWorkoutsState) {
              return Loader();
            }

            if (state is LoadedWorkoutsState) {
              _refreshController.refreshCompleted();
              _refreshController.loadComplete();

              if (state.workouts.isNullOrEmpty()) {
                return NoContent();
              }

              return ListView(
                cacheExtent: 100000,
                children: state.workouts
                    .map<Widget>(
                      (x) => WorkoutListTile(workout: x),
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
