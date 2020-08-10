import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  AppState();

  @override
  List<Object> get props => [];
}

class InitialAppState extends AppState {
  @override
  List<Object> get props => [];
}

class LoadingAppState extends AppState {
  LoadingAppState();

  @override
  List<Object> get props => [];
}

class LoadedAppState extends AppState {
  LoadedAppState();

  @override
  List<Object> get props => [];
}
