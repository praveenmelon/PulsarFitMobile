import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:pulsar_fit/presentation/common/loader.dart';
import 'package:pulsar_fit/presentation/common/no_content.dart';
import 'package:pulsar_fit/presentation/exercises/exercise_list_tile.dart';
import 'package:pulsar_fit/blocs/exercises_bloc/bloc.dart';
import 'package:pulsar_fit/common/extensions.dart';

class Exercises extends StatefulWidget {
  @override
  _ExercisesState createState() => _ExercisesState();
}

class _ExercisesState extends State<Exercises> {
  final RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final exercisesBloc = context.bloc<ExercisesBloc>();

    return BlocBuilder<ExercisesBloc, ExercisesState>(
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
            exercisesBloc.add(RefreshExercisesEvent());
          },
          onLoading: () async {
            exercisesBloc.add(LoadMoreExercisesEvent());
          },
          child: () {
            if (state is LoadingExercisesState) {
              return Loader();
            }

            if (state is LoadedExercisesState) {
              _refreshController.refreshCompleted();
              _refreshController.loadComplete();

              if (state.exercises.isNullOrEmpty()) {
                return NoContent();
              }

              return ListView(
                cacheExtent: 100000,
                children: state.exercises
                    .map<Widget>(
                      (x) => ExerciseListTile(exercise: x),
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
