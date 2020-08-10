import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulsar_fit/blocs/navigation_bloc/bloc.dart';
import 'package:pulsar_fit/blocs/plans_bloc/bloc.dart';
import 'package:pulsar_fit/blocs/workouts_bloc/bloc.dart';
import 'package:pulsar_fit/blocs/exercises_bloc/bloc.dart';

import 'package:pulsar_fit/common/extensions.dart';

import 'package:pulsar_fit/presentation/app_icons.dart';
import 'package:pulsar_fit/presentation/common/app_logo.dart';
import 'package:pulsar_fit/presentation/common/pulsating_icon.dart';
import 'package:pulsar_fit/presentation/settings/settings_screen.dart';
import 'package:pulsar_fit/presentation/plans/plans.dart';
import 'package:pulsar_fit/presentation/plans/plans_filters.dart';
import 'package:pulsar_fit/presentation/workouts/workouts.dart';
import 'package:pulsar_fit/presentation/workouts/workouts_filters.dart';
import 'package:pulsar_fit/presentation/exercises/exercises.dart';
import 'package:pulsar_fit/presentation/exercises/exercises_filters.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Widget> _pages = [
    Plans(),
    Workouts(),
    Exercises(),
  ];
  final List<Widget> _filters = [
    PlansFilters(),
    WorkoutsFilters(),
    ExercisesFilters(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme();
    final appTheme = context.appTheme();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: theme.canvasColor,
        statusBarColor: Colors.blue,
        statusBarBrightness: appTheme.theme.brightness == Brightness.light ? Brightness.dark : Brightness.light,
        statusBarIconBrightness: appTheme.theme.brightness == Brightness.light ? Brightness.dark : Brightness.light,
        systemNavigationBarIconBrightness: appTheme.theme.brightness == Brightness.light ? Brightness.dark : Brightness.light,
      ),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          final currentPage = state is PageChangedNavigationState ? state.currentPage : 0;

          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(AppIcons.settings, size: 20, color: Colors.white),
                onPressed: () {
                  context.navigator().pushNamed(SettingsScreen.route);
                },
              ),
              centerTitle: true,
              title: AppLogo(),
              actions: <Widget>[
                if (currentPage == 0)
                  BlocBuilder<PlansBloc, PlansState>(
                    builder: (context, state) {
                      return PulsatingIcon(
                        pulsate: state.areFiltersSet,
                        onTap: () {
                          _scaffoldKey.currentState.openEndDrawer();
                        },
                      );
                    },
                  ),
                if (currentPage == 1)
                  BlocBuilder<WorkoutsBloc, WorkoutsState>(
                    builder: (context, state) {
                      return PulsatingIcon(
                        pulsate: state.areFiltersSet,
                        onTap: () {
                          _scaffoldKey.currentState.openEndDrawer();
                        },
                      );
                    },
                  ),
                if (currentPage == 2)
                  BlocBuilder<ExercisesBloc, ExercisesState>(
                    builder: (context, state) {
                      return PulsatingIcon(
                        pulsate: state.areFiltersSet,
                        onTap: () {
                          _scaffoldKey.currentState.openEndDrawer();
                        },
                      );
                    },
                  ),
              ],
            ),
            body: _pages[currentPage],
            bottomNavigationBar: _buildCurvedBottomNavigationBar(context, currentPage),
            endDrawer: _filters[currentPage],
          );
        },
      ),
    );
  }

  Widget _buildCurvedBottomNavigationBar(BuildContext context, int currentPage) {
    final navigationBloc = context.bloc<NavigationBloc>();

    return CurvedNavigationBar(
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: Colors.transparent,
      height: 50,
      color: context.appTheme().theme.primaryColor,
      onTap: (index) {
        navigationBloc.add(ChangePageNavigationEvent(page: index));
      },
      items: [
        Icon(AppIcons.plans, size: 20, color: Colors.white),
        Icon(AppIcons.workouts, size: 20, color: Colors.white),
        Icon(AppIcons.exercises, size: 20, color: Colors.white),
      ],
    );
  }
}
