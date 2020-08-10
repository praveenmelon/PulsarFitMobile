import 'package:flutter/material.dart';
import 'package:just_debounce_it/just_debounce_it.dart';
import 'package:pulsar_fit/blocs/exercises_bloc/bloc.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExercisesFilters extends StatefulWidget {
  @override
  _ExercisesFiltersState createState() => _ExercisesFiltersState();
}

class _ExercisesFiltersState extends State<ExercisesFilters> {
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
    final exercisesBloc = context.bloc<ExercisesBloc>();

    return GestureDetector(
      onTap: () {
        _searchFocusNode.unfocus();
      },
      child: Drawer(
        child: Container(
          color: context.appTheme().theme.scaffoldBackgroundColor,
          padding: EdgeInsets.only(top: 15),
          child: BlocBuilder<ExercisesBloc, ExercisesState>(
            builder: (context, state) {
              _searchController.clear();
              _searchController.text = state.exerciseSearchRequest.name;
              _searchController.selection = TextSelection.fromPosition(TextPosition(offset: _searchController.text?.length));
              return ListView(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(context.localizer().translation.exercisesFilters, style: TextStyle(color: context.appTheme().theme.accentColor)),
                      GestureDetector(
                        onTap: () {
                          exercisesBloc.add(ClearFiltersExercisesEvent());
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
                        exercisesBloc.add(
                          SearchExercisesEvent(
                            exerciseSearchRequest: state.exerciseSearchRequest.copyWith(name: _searchController.text),
                          ),
                        );
                      }, []);
                    },
                    decoration: InputDecoration(
                      hintText: context.localizer().translation.searchExercises,
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
