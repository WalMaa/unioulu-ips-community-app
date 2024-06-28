import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '../../domain/entities/language_entity.dart';
import '../../domain/usecases/get_languages.dart';
import '../../domain/usecases/get_saved_language.dart';
import '../../domain/usecases/set_language.dart';
import 'language_event.dart';
import 'language_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final GetLanguages getLanguages;
  final SetLanguage setLanguage;
  final GetSavedLanguage getSavedLanguage;

  LocalizationBloc({
    required this.getLanguages,
    required this.setLanguage,
    required this.getSavedLanguage,
  }) : super(LocalizationState.initial()) {
    on<LoadSavedLocalization>(_getSavedLanguage);
    on<LoadLocalization>(_changeLanguage);
    on<LoadLanguages>(_loadLanguages);

    add(LoadLanguages());
  }

  void _changeLanguage(
      LoadLocalization event, Emitter<LocalizationState> emit) async {
    if (kDebugMode) {
      print('Change language to ${event.locale.languageCode}');
    }
    if (event.locale == state.locale) return;
    try {
      await setLanguage(LanguageEntity(
          language: event.locale.languageCode,
          subLanguage: '',
          languageCode: event.locale.languageCode));
      emit(state.copyWith(locale: event.locale));
    } catch (error) {
      if (kDebugMode) {
        print('Error changing language: $error');
      }
    }
  }

  Future<void> _getSavedLanguage(
      LoadSavedLocalization event, Emitter<LocalizationState> emit) async {
    if (kDebugMode) {
      print('Get saved language');
    }
    final language = await getSavedLanguage();
    emit(state.copyWith(locale: Locale(language.languageCode)));
  }

  Future<void> _loadLanguages(
      LoadLanguages event, Emitter<LocalizationState> emit) async {
    if (kDebugMode) {
      print('Load languages');
    }
    final languages = await getLanguages();
    if (kDebugMode) {
      print('Languages loaded: ${languages.length}');
    }
    emit(state.copyWith(languages: languages));
  }
}
