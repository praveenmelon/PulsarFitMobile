import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:pulsar_fit/blocs/app_bloc/bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(LoadingAppState());

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is SetupAppEvent) {
      await Future.delayed(const Duration(seconds: 5));
      yield LoadedAppState();
    }
  }
}
