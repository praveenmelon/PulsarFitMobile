import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';
import 'package:pulsar_fit/blocs/app_bloc/bloc.dart';
import 'package:pulsar_fit/repositories/storage_repository.dart';

import 'package:pulsar_fit/application.dart';

import 'package:pulsar_fit/blocs/theme_bloc/bloc.dart';
import 'package:pulsar_fit/blocs/navigation_bloc/bloc.dart';
import 'package:pulsar_fit/blocs/localization_bloc/bloc.dart';
import 'package:pulsar_fit/blocs/plans_bloc/bloc.dart';
import 'package:pulsar_fit/blocs/workouts_bloc/bloc.dart';
import 'package:pulsar_fit/blocs/exercises_bloc/bloc.dart';

import 'package:pulsar_fit/repositories/fcm_repository.dart';

import 'blocs/plan_details_bloc/bloc.dart';
import 'blocs/workout_details_bloc/bloc.dart';
import 'common/api_client.dart';
import 'data_providers/plans_data_provider.dart';
import 'data_providers/workouts_data_provider.dart';
import 'data_providers/exercises_data_provider.dart';
import 'repositories/plans_repository.dart';
import 'repositories/workouts_repository.dart';
import 'repositories/exercises_repository.dart';

void main() async {
  await Hive.initFlutter();
  Intl.defaultLocale = 'bs';

  final firebaseMessaging = FirebaseMessaging();

  final storageBox = await Hive.openBox('storageBox');

  final apiClient = ApiClient();
  apiClient.setContentType('application/json');
  apiClient.setBaseUrl('http://80ebdc8481a7.ngrok.io');

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (BuildContext context) => StorageRepository(
            box: storageBox,
          ),
          lazy: false,
        ),
        RepositoryProvider(
          create: (BuildContext context) => FcmRepository(
            storageRepository: RepositoryProvider.of<StorageRepository>(context),
            firebaseMessaging: firebaseMessaging,
          ),
          lazy: false,
        ),
        RepositoryProvider(
          create: (BuildContext context) => ExercisesRepository(
            apiDataProvider: ExercisesDataProvider(apiClient: apiClient),
          ),
          lazy: false,
        ),
        RepositoryProvider(
          create: (BuildContext context) => PlansRepository(
            apiDataProvider: PlansDataProvider(apiClient: apiClient),
          ),
          lazy: false,
        ),
        RepositoryProvider(
          create: (BuildContext context) => WorkoutsRepository(
            apiDataProvider: WorkoutsDataProvider(apiClient: apiClient),
          ),
          lazy: false,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            lazy: false,
            create: (BuildContext context) => AppBloc()..add(SetupAppEvent()),
          ),
          BlocProvider<ExercisesBloc>(
            create: (BuildContext context) => ExercisesBloc(
              exercisesRepository: RepositoryProvider.of<ExercisesRepository>(context),
            )..add(LoadExercisesEvent()),
            lazy: false,
          ),
          BlocProvider<LocalizationBloc>(
            create: (BuildContext context) => LocalizationBloc(
              apiClient: apiClient,
              storageRepository: RepositoryProvider.of<StorageRepository>(context),
            )..add(LoadLocalizationEvent()),
            lazy: false,
          ),
          BlocProvider<NavigationBloc>(
            create: (BuildContext context) => NavigationBloc(),
            lazy: false,
          ),
          BlocProvider<PlanDetailsBloc>(
            create: (BuildContext context) => PlanDetailsBloc(
              plansRepository: RepositoryProvider.of<PlansRepository>(context),
            ),
            lazy: false,
          ),
          BlocProvider<PlansBloc>(
            create: (BuildContext context) => PlansBloc(
              plansRepository: RepositoryProvider.of<PlansRepository>(context),
            )..add(LoadPlansEvent()),
            lazy: false,
          ),
          BlocProvider<ThemeBloc>(
            create: (BuildContext context) => ThemeBloc(
              storageRepository: RepositoryProvider.of<StorageRepository>(context),
            )..add(LoadThemeEvent()),
            lazy: false,
          ),
          BlocProvider<WorkoutDetailsBloc>(
            create: (BuildContext context) => WorkoutDetailsBloc(
              workoutsRepository: RepositoryProvider.of<WorkoutsRepository>(context),
            ),
            lazy: false,
          ),
          BlocProvider<WorkoutsBloc>(
            create: (BuildContext context) => WorkoutsBloc(
              workoutsRepository: RepositoryProvider.of<WorkoutsRepository>(context),
            )..add(LoadWorkoutsEvent()),
            lazy: false,
          ),
        ],
        child: Application(),
      ),
    ),
  );
}

void setOrientationPortrait() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void setOrientationRotation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
}
