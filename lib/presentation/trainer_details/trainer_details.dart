import 'package:flutter/material.dart';
import 'package:pulsar_fit/blocs/theme_bloc/bloc.dart';
import 'package:pulsar_fit/blocs/theme_bloc/theme_bloc.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulsar_fit/presentation/app_icons.dart';
import 'package:pulsar_fit/presentation/common/dot.dart';

import 'package:pulsar_fit/presentation/common/loader.dart';

class SettingsScreen extends StatelessWidget {
  static const String route = '/SettingsScreen';

  @override
  Widget build(BuildContext context) {
    final localizer = context.localizer();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.localizer().translation.settings,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: ListTile(
              onTap: () {
                _selectThemeBottomSheet(context);
              },
              leading: Icon(
                AppIcons.theme,
                color: context.appTheme().theme.primaryIconTheme.color,
              ),
              title: Text(localizer.translation.theme),
            ),
          ),
        ],
      ),
    );
  }

  void _selectThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        final theme = context.theme();
        final localizer = context.localizer();
        final themeBloc = context.bloc<ThemeBloc>();

        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return Container(
              color: theme.scaffoldBackgroundColor,
              child: Wrap(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: ListTile(
                      leading: Icon(
                        AppIcons.light_theme,
                      ),
                      title: Text(localizer.translation.lightTheme),
                      trailing: state.themeMode == ThemeMode.light ? Dot() : null,
                      onTap: () {
                        themeBloc.add(ChangeThemeEvent(themeMode: ThemeMode.light));
                      },
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: ListTile(
                      leading: Icon(
                        AppIcons.dark_theme,
                      ),
                      title: Text(localizer.translation.darkTheme),
                      trailing: state.themeMode == ThemeMode.dark ? Dot() : null,
                      onTap: () {
                        themeBloc.add(ChangeThemeEvent(themeMode: ThemeMode.dark));
                      },
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: ListTile(
                      leading: Icon(
                        AppIcons.system_theme,
                      ),
                      title: Text(localizer.translation.systemTheme),
                      trailing: state.themeMode == ThemeMode.system ? Dot() : null,
                      onTap: () {
                        themeBloc.add(ChangeThemeEvent(themeMode: ThemeMode.system));
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
