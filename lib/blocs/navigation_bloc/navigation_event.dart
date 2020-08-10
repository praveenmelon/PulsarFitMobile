import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();
}

class ChangePageNavigationEvent extends NavigationEvent {
  final int page;

  ChangePageNavigationEvent({
    @required this.page,
  }) : assert(page != null);

  @override
  List<Object> get props => [page];
}
