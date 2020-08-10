import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pulsar_fit/blocs/app_bloc/bloc.dart';

import 'package:pulsar_fit/blocs/theme_bloc/bloc.dart';
import 'package:pulsar_fit/blocs/localization_bloc/bloc.dart';

import 'package:pulsar_fit/common/extensions.dart';
import 'package:pulsar_fit/common/localization/localizer.dart';

import 'package:pulsar_fit/presentation/app_theme.dart';
import 'package:pulsar_fit/presentation/exercises/exercise_details_screen.dart';
import 'package:pulsar_fit/presentation/plans/plan_details_screen.dart';
import 'package:pulsar_fit/presentation/settings/settings_screen.dart';
import 'package:pulsar_fit/presentation/workouts/workout_details_screen.dart';
import 'package:pulsar_fit/repositories/fcm_repository.dart';

import 'main.dart';
import 'models/responses/firebase_message.dart';
import 'presentation/home_screen/home_screen.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
    setOrientationPortrait();
  }

  void _initFirebaseMessageResponder(BuildContext context) {
    // final fcmRepository = RepositoryProvider.of<FcmRepository>(context);

    // if (!fcmRepository.streamController.hasListener) {
    //   fcmRepository.streamController.stream.listen(
    //     (FirebaseMessage message) {
    //       //Add notification listener logic here
    //     },
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (BuildContext context, LocalizationState localizationState) {
        return BlocBuilder<ThemeBloc, ThemeState>(
          builder: (BuildContext context, ThemeState themeState) {
            return NotificationListener<OverscrollIndicatorNotification>(
              child: MaterialApp(
                themeMode: themeState.themeMode,
                theme: _lightAppTheme().theme,
                darkTheme: _darkAppTheme().theme,
                localizationsDelegates: [
                  Localizer.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                ],
                builder: (BuildContext context, Widget child) {
                  context.localizer().changeLanguage(localizationState.locale);

                  return AppTheme(
                    child: child,
                    appTheme: context.theme().brightness == Brightness.light ? _lightAppTheme() : _darkAppTheme(),
                  );
                },
                onGenerateTitle: (BuildContext context) {
                  return context.localizer().translation.applicationName;
                },
                home: BlocBuilder<AppBloc, AppState>(
                  builder: (context, state) {
                    if (state is LoadingAppState) {
                      _initFirebaseMessageResponder(context);
                    }
                    return HomeScreen();
                  },
                ),
                locale: localizationState.locale,
                debugShowCheckedModeBanner: false,
                localeResolutionCallback: Localizer.getSupportedLocale,
                onGenerateRoute: _onGenerateRoute,
              ),
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return true;
              },
            );
          },
        );
      },
    );
  }
}

PageRoute _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case ExerciseDetailsScreen.route:
      return MaterialPageRoute(builder: (_) => ExerciseDetailsScreen(exercise: settings.arguments));
    case PlanDetailsScreen.route:
      return MaterialPageRoute(builder: (_) => PlanDetailsScreen(plan: settings.arguments));
    case SettingsScreen.route:
      return MaterialPageRoute(builder: (_) => SettingsScreen());
    case WorkoutDetailsScreen.route:
      return MaterialPageRoute(builder: (_) => WorkoutDetailsScreen(workout: settings.arguments));
  }

  return MaterialPageRoute(builder: (_) => HomeScreen());
}

AppThemeData _lightAppTheme() {
  return AppThemeData(
    mutedColor: const Color(0xFFD3D3D3),
    successColor: Colors.red,
    // successColor: const Color(0xFF3AC09B),
    textFieldBorderColor: const Color(0xFFEDEDED),
    elevationShadowColor: const Color(0xFFEDEDED),
    textFieldErrorBorderColor: const Color(0xFFF44336),
    theme: ThemeData(
      fontFamily: 'Muli',
      accentColor: Colors.blue,
      brightness: Brightness.light,
      errorColor: const Color(0xFFF44336),
      cursorColor: const Color(0xFFF05063),
      primaryColor: const Color(0xFF052962),
      indicatorColor: const Color(0xFFF05063),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryIconTheme: IconThemeData(color: Colors.black45),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
          subtitle1: TextStyle(color: Colors.white),
          subtitle2: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          caption: TextStyle(color: Colors.white),
          button: TextStyle(color: Colors.white),
          overline: TextStyle(color: Colors.white),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30.0),
        ),
        contentPadding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
        filled: true,
        fillColor: const Color(0xFF323233),
        hintStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        labelStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        errorStyle: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(),
        headline2: TextStyle(),
        headline3: TextStyle(),
        headline4: TextStyle(),
        headline5: TextStyle(),
        headline6: TextStyle(),
        subtitle1: TextStyle(),
        subtitle2: TextStyle(),
        bodyText1: TextStyle(),
        bodyText2: TextStyle(),
        caption: TextStyle(),
        button: TextStyle(),
        overline: TextStyle(),
      ),
      // primarySwatch:
      primaryColorBrightness: Brightness.light,
      primaryColorLight: const Color(0xFF052962),
      // primaryColorLight:
      // primaryColorDark:
      // accentColorBrightness:
      // canvasColor:
      // bottomAppBarColor:
      // cardColor:
      // dividerColor:
      // focusColor:
      // hoverColor:
      // highlightColor:
      // splashColor:
      // splashFactory:
      // selectedRowColor:
      // unselectedWidgetColor:
      // disabledColor:
      // buttonColor:
      // buttonTheme:
      // toggleButtonsTheme:
      // secondaryHeaderColor:
      // textSelectionColor:
      // textSelectionHandleColor:
      // backgroundColor:
      // dialogBackgroundColor:
      // hintColor:
      // toggleableActiveColor:
      // primaryTextTheme:
      // accentTextTheme:
      // iconTheme:
      // accentIconTheme:
      // sliderTheme:
      // tabBarTheme:
      // tooltipTheme:
      // cardTheme:
      // chipTheme:
      // platform:
      // materialTapTargetSize:
      // applyElevationOverlayColor:
      // pageTransitionsTheme:
      // bottomAppBarTheme:
      // colorScheme:
      // dialogTheme:
      // floatingActionButtonTheme:
      // navigationRailTheme:
      // typography:
      // cupertinoOverrideTheme:
      // snackBarTheme:
      // bottomSheetTheme:
      // popupMenuTheme:
      // bannerTheme:
      // dividerTheme:
      // buttonBarTheme:
    ),
  );
}

AppThemeData _darkAppTheme() {
  var brightness2 = null;
  return AppThemeData(
    mutedColor: const Color(0xFFD3D3D3),
    successColor: Colors.blue,
    // successColor: const Color(0xFF3AC09B),
    textFieldBorderColor: const Color(0xFFEDEDED),
    elevationShadowColor: const Color(0xFFEDEDED),
    textFieldErrorBorderColor: const Color(0xFFF44336),
    theme: ThemeData(
      fontFamily: 'Muli',
      accentColor: Colors.orange,
      brightness: Brightness.dark,
      errorColor: const Color(0xFFF44336),
      cursorColor: Colors.blue,
      primaryColor: const Color(0xFF323233),
      indicatorColor: const Color(0xFFF05063),
      scaffoldBackgroundColor: const Color(0xFF1e1e1e),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryIconTheme: IconThemeData(color: Colors.white),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(30.0),
        ),
        contentPadding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
        filled: true,
        fillColor: const Color(0xFF323233),
        hintStyle: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        labelStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        errorStyle: const TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        headline3: TextStyle(color: Colors.white),
        headline4: TextStyle(color: Colors.white),
        headline5: TextStyle(color: Colors.white),
        headline6: TextStyle(color: Colors.white),
        subtitle1: TextStyle(color: Colors.white),
        subtitle2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
        caption: TextStyle(color: Colors.white),
        button: TextStyle(color: Colors.white),
        overline: TextStyle(color: Colors.white),
      ),
      // primarySwatch:
      primaryColorBrightness: Brightness.dark,
      primaryColorLight: const Color(0xFF323233),
      // primaryColorDark:
      // accentColorBrightness:
      // canvasColor:
      // bottomAppBarColor:
      // cardColor:
      // dividerColor:
      // focusColor:
      // hoverColor:
      // highlightColor:
      // splashColor:
      // splashFactory:
      // selectedRowColor:
      // unselectedWidgetColor:
      // disabledColor:
      // buttonColor:
      // buttonTheme:
      // toggleButtonsTheme:
      // secondaryHeaderColor:
      // textSelectionColor:
      // textSelectionHandleColor:
      // backgroundColor:
      // dialogBackgroundColor:
      // hintColor:
      // toggleableActiveColor:
      // primaryTextTheme:
      // accentTextTheme:
      // iconTheme:
      // accentIconTheme:
      // sliderTheme:
      // tabBarTheme:
      // tooltipTheme:
      // cardTheme:
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFF323233),
        brightness: Brightness.light,
        disabledColor: Colors.grey,
        labelPadding: EdgeInsets.zero,
        labelStyle: TextStyle(color: Colors.white, fontSize: 12),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        secondaryLabelStyle: TextStyle(color: Colors.white),
        secondarySelectedColor: Colors.orangeAccent,
        selectedColor: Colors.orange,
        shape: StadiumBorder(),
      ),
      // platform:
      // materialTapTargetSize:
      // applyElevationOverlayColor:
      // pageTransitionsTheme:
      // bottomAppBarTheme:
      // colorScheme:
      // dialogTheme:
      // floatingActionButtonTheme:
      // navigationRailTheme:
      // typography:
      // cupertinoOverrideTheme:
      // snackBarTheme:
      // bottomSheetTheme:
      // popupMenuTheme:
      // bannerTheme:
      // dividerTheme:
      // buttonBarTheme:
    ),
  );
}
