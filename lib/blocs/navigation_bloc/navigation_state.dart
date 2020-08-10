import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();
}

class InitialNavigationState extends NavigationState {
  @override
  List<Object> get props => [];
}

class PageChangedNavigationState extends NavigationState {
  final int currentPage;

  PageChangedNavigationState({
    @required this.currentPage,
  }) : assert(currentPage != null);

  @override
  List<Object> get props => [currentPage];
}
