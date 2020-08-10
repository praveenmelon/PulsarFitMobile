import 'package:flutter/material.dart';
import 'package:just_debounce_it/just_debounce_it.dart';
import 'package:pulsar_fit/blocs/workouts_bloc/bloc.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutsFilters extends StatefulWidget {
  @override
  _WorkoutsFiltersState createState() => _WorkoutsFiltersState();
}

class _WorkoutsFiltersState extends State<WorkoutsFilters> {
  final _searchFocusNode = FocusNode();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workoutsBloc = context.bloc<WorkoutsBloc>();

    return GestureDetector(
      onTap: () {
        _searchFocusNode.unfocus();
      },
      child: Drawer(
        child: Container(
          color: context.appTheme().theme.scaffoldBackgroundColor,
          padding: EdgeInsets.only(top: 15),
          child: BlocBuilder<WorkoutsBloc, WorkoutsState>(
            builder: (context, state) {
              _searchController.clear();
              _searchController.text = state.workoutSearchRequest.name;
              _searchController.selection = TextSelection.fromPosition(TextPosition(offset: _searchController.text?.length));
              return ListView(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.localizer().translation.workoutsFilters, style: TextStyle(color: context.appTheme().theme.accentColor)),
                      GestureDetector(
                        onTap: () {
                          workoutsBloc.add(ClearFiltersWorkoutsEvent());
                        },
                        child: Chip(
                          deleteIconColor: Colors.white,
                          avatar: Icon(Icons.cancel, color: Colors.white),
                          backgroundColor: context.appTheme().theme.primaryColor,
                          padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                          label: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              context.localizer().translation.clear.toLowerCase(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    onChanged: (value) {
                      Debounce.duration(const Duration(milliseconds: 500), () {
                        workoutsBloc.add(
                          SearchWorkoutsEvent(
                            workoutSearchRequest: state.workoutSearchRequest.copyWith(name: _searchController.text),
                          ),
                        );
                      }, []);
                    },
                    decoration: InputDecoration(
                      hintText: context.localizer().translation.searchWorkouts,
                      suffixIcon: Icon(Icons.search, size: 25, color: context.appTheme().theme.accentColor),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
