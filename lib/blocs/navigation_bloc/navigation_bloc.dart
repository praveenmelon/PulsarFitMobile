import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:pulsar_fit/blocs/navigation_bloc/bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final int initialPage = 0;

  NavigationBloc()
      : super(
          PageChangedNavigationState(
            currentPage: 0,
          ),
        );

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is ChangePageNavigationEvent) {
      yield PageChangedNavigationState(
        currentPage: event.page,
      );
    }
  }
}
