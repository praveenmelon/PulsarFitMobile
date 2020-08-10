import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:pulsar_fit/blocs/theme_bloc/bloc.dart';
import 'package:pulsar_fit/presentation/app_keys.dart';

import 'package:pulsar_fit/repositories/storage_repository.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final StorageRepository storageRepository;

  ThemeBloc({
    @required this.storageRepository,
  })  : assert(storageRepository != null),
        super(ThemeState(themeMode: ThemeMode.dark));

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is LoadThemeEvent) {
      yield* _load();
    } else if (event is ChangeThemeEvent) {
      yield* _change(event);
    }
  }

  Stream<ThemeState> _load() async* {
    final themeModeIndex = await storageRepository.get<int>(AppKeys.themeMode);

    if (themeModeIndex == null) {
      yield ThemeState(themeMode: ThemeMode.dark);
    } else {
      yield ThemeState(themeMode: ThemeMode.values[themeModeIndex]);
    }
  }

  Stream<ThemeState> _change(ChangeThemeEvent event) async* {
    await storageRepository.set(AppKeys.themeMode, event.themeMode.index);

    yield ThemeState(themeMode: event.themeMode);
  }
}
