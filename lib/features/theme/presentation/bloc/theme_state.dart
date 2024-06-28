part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeInitial extends ThemeState {}

class ThemeLoaded extends ThemeState {
  final AppTheme theme;

  const ThemeLoaded(this.theme);

  @override
  List<Object> get props => [theme];
}
