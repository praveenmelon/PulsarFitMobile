import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class SetupAppEvent extends AppEvent {
  SetupAppEvent();

  @override
  List<Object> get props => [];
}
