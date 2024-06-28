import 'dart:ui';
import 'package:equatable/equatable.dart';
import '../../domain/entities/language_entity.dart';

class LocalizationState extends Equatable {
  final Locale locale;
  final List<LanguageEntity> languages;

  const LocalizationState({
    required this.locale,
    this.languages = const [],
  });

  factory LocalizationState.initial() {
    return const LocalizationState(locale: Locale('fi'));
  }

  LocalizationState copyWith({
    Locale? locale,
    List<LanguageEntity>? languages,
  }) {
    return LocalizationState(
      locale: locale ?? this.locale,
      languages: languages ?? this.languages,
    );
  }

  @override
  List<Object?> get props => [locale, languages];
}
