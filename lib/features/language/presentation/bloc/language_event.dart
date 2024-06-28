import 'dart:ui';
import 'package:equatable/equatable.dart';

abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object?> get props => [];
}

class LoadSavedLocalization extends LocalizationEvent {}

class LoadLocalization extends LocalizationEvent {
  final Locale locale;

  const LoadLocalization(this.locale);

  @override
  List<Object?> get props => [locale];
}

class LoadLanguages extends LocalizationEvent {}
