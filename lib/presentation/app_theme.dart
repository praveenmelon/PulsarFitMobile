import 'package:flutter/material.dart';

@immutable
class AppThemeData {
  final ThemeData theme;
  final Color mutedColor;
  final Color successColor;
  final Color textFieldBorderColor;
  final Color elevationShadowColor;
  final Color textFieldErrorBorderColor;

  AppThemeData({
    @required this.theme,
    @required this.mutedColor,
    @required this.successColor,
    @required this.textFieldBorderColor,
    @required this.elevationShadowColor,
    @required this.textFieldErrorBorderColor,
  })  : assert(theme != null),
        assert(mutedColor != null),
        assert(successColor != null),
        assert(textFieldBorderColor != null),
        assert(elevationShadowColor != null),
        assert(textFieldErrorBorderColor != null);
}

class AppTheme extends StatelessWidget {
  final Widget child;
  final WidgetBuilder builder;
  final AppThemeData appTheme;

  const AppTheme({
    Key key,
    this.child,
    this.builder,
    @required this.appTheme,
  })  : assert(appTheme != null),
        assert(child != null || builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _InheritedAppTheme(
      appThemeData: appTheme,
      child: child ?? builder(context),
    );
  }

  static AppThemeData of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedAppTheme>()).appThemeData;
  }
}

class _InheritedAppTheme extends InheritedWidget {
  final AppThemeData appThemeData;

  const _InheritedAppTheme({
    Key key,
    @required Widget child,
    @required this.appThemeData,
  })  : assert(appThemeData != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedAppTheme old) => appThemeData != old.appThemeData;
}
