import 'package:flutter/material.dart';
import 'package:pulsar_fit/blocs/plan_details_bloc/bloc.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:pulsar_fit/models/responses/plan.dart';
import 'package:pulsar_fit/presentation/common/button.dart';
import 'package:pulsar_fit/presentation/common/level_indicators.dart';
import 'package:pulsar_fit/presentation/common/loader.dart';
import 'package:pulsar_fit/presentation/plans/plan_result.dart';
import 'package:pulsar_fit/presentation/plans/plan_workout_list_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulsar_fit/presentation/common/error.dart';

class PlanDetailsScreen extends StatefulWidget {
  static const String route = '/PlanDetailsScreen';

  final Plan plan;

  PlanDetailsScreen({@required this.plan}) : assert(plan != null);

  @override
  _PlanDetailsScreenState createState() => _PlanDetailsScreenState();
}

class _PlanDetailsScreenState extends State<PlanDetailsScreen> {
  @override
  void initState() {
    super.initState();

    context.bloc<PlanDetailsBloc>().add(LoadPlanDetailsEvent(id: widget.plan.id));
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraints) {
                    var top = constraints.biggest.height;

                    return FlexibleSpaceBar(
                      background: Image.network(
                        widget.plan.multimediaFile.url.toNetworkPhotoUrl(),
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                        color: Colors.black45,
                      ),
                      centerTitle: top > 100,
                      title: top <= 100
                          ? Text(
                              widget.plan.name.cut(15),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(widget.plan.name.cut(35)),
                              ],
                            ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: LevelIndicators(
                  padding: const EdgeInsets.all(20),
                  cardioLevel: widget.plan.cardioLevel,
                  strengthLevel: widget.plan.strengthLevel,
                  planLevel: widget.plan.planLevel,
                ),
              ),
              if (widget.plan.planResults.isNotNullOrEmpty())
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      ListTile(title: Text(context.localizer().translation.planResults, style: TextStyle(color: context.appTheme().theme.accentColor))),
                      ...widget.plan.planResults
                          .map(
                            (planResult) => PlanResult(text: planResult.name),
                          )
                          .toList(),
                    ],
                  ),
                ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ListTile(
                      title: Text(
                        context.localizer().translation.workouts,
                        style: TextStyle(
                          color: context.appTheme().theme.accentColor,
                        ),
                      ),
                    ),
                    BlocBuilder<PlanDetailsBloc, PlanDetailsState>(
                      builder: (context, state) {
                        if (state is LoadingPlanDetailsState) {
                          return Loader();
                        }

                        if (state is LoadedPlanDetailsState) {
                          if (state.plan.planWorkouts.isNotNullOrEmpty()) {
                            return Column(
                              children: state.plan.planWorkouts
                                  .map(
                                    (planWorkout) => PlanWorkoutListTile(planWorkout: planWorkout),
                                  )
                                  .toList(),
                            );
                          } else {
                            return Container();
                          }
                        }

                        return Error();
                      },
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                _theme.primaryColor,
              ],
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: Button.rounded(
              child: Text(context.localizer().translation.startThePlan),
              margin: EdgeInsets.all(30),
              color: _theme.accentColor,
            ),
          ),
        ),
      ],
    );
  }
}
