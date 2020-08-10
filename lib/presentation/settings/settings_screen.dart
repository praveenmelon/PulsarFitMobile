import 'package:flutter/material.dart';
import 'package:pulsar_fit/blocs/localization_bloc/bloc.dart';
import 'package:pulsar_fit/blocs/theme_bloc/bloc.dart';
import 'package:pulsar_fit/blocs/theme_bloc/theme_bloc.dart';
import 'package:pulsar_fit/common/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulsar_fit/common/localization/localizer.dart';
import 'package:pulsar_fit/presentation/app_icons.dart';
import 'package:pulsar_fit/presentation/common/dot.dart';

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
              leading: Icon(AppIcons.theme),
              title: Text(localizer.translation.theme),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: ListTile(
              onTap: () {
                _selectLanguageBottomSheet(context);
              },
              leading: Icon(AppIcons.languages),
              title: Text(localizer.translation.language),
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

  void _selectLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        final theme = context.theme();
        final localizationBloc = context.bloc<LocalizationBloc>();

        return BlocBuilder<LocalizationBloc, LocalizationState>(
          builder: (context, state) {
            return Container(
              color: theme.scaffoldBackgroundColor,
              child: Wrap(
                children: Localizer.supportedLanguages
                    .map(
                      (langauge) => Material(
                        color: Colors.transparent,
                        child: ListTile(
                          leading: Container(
                            height: 30,
                            width: 30,
                            child: Image.asset(langauge.iconPath),
                          ),
                          title: Text(langauge.name),
                          trailing: state.locale.languageCode == langauge.locale.languageCode ? Dot() : null,
                          onTap: () {
                            localizationBloc.add(ChangeLocalizationEvent(locale: langauge.locale));
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            );
          },
        );
      },
    );
  }
}
