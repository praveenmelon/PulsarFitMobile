import 'dart:ui';
import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:pulsar_fit/common/api_client.dart';
import 'package:pulsar_fit/common/localization/localizer.dart';

import 'package:pulsar_fit/blocs/localization_bloc/bloc.dart';

import 'package:pulsar_fit/repositories/storage_repository.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final ApiClient _apiClient;
  final StorageRepository _storageRepository;

  LocalizationBloc({
    @required ApiClient apiClient,
    @required StorageRepository storageRepository,
  })  : assert(apiClient != null),
        assert(storageRepository != null),
        _apiClient = apiClient,
        _storageRepository = storageRepository,
        super(LocalizationState(
          locale: Localizer.defaultLanguage.locale,
        ));

  @override
  Stream<LocalizationState> mapEventToState(LocalizationEvent event) async* {
    if (event is LoadLocalizationEvent) {
      yield* _load();
    } else if (event is ChangeLocalizationEvent) {
      yield* _change(event);
    }
  }

  Stream<LocalizationState> _load() async* {
    final languageCode = await _storageRepository.get('languageCode');
    if (languageCode == null) {
      yield UnfinishedLocalizationState(
        locale: Localizer.defaultLanguage.locale,
      );
    } else {
      _apiClient.setAcceptLanguage(languageCode);

      yield ChangedLocalizationState(locale: Locale(languageCode));
    }
  }

  Stream<LocalizationState> _change(ChangeLocalizationEvent event) async* {
    _apiClient.setAcceptLanguage(event.locale.languageCode);

    await _storageRepository.set('languageCode', event.locale.languageCode);

    yield ChangedLocalizationState(locale: event.locale);
  }
}
