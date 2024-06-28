import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/usecases/get_theme.dart';
import '../../domain/usecases/set_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final GetTheme getTheme;
  final SetTheme setTheme;

  ThemeBloc({required this.getTheme, required this.setTheme})
      : super(ThemeInitial()) {
    on<LoadThemeEvent>(_onLoadTheme);
    on<ChangeThemeEvent>(_onChangeTheme);
  }

  void _onLoadTheme(LoadThemeEvent event, Emitter<ThemeState> emit) async {
    final theme = await getTheme();
    emit(ThemeLoaded(theme));
  }

  void _onChangeTheme(ChangeThemeEvent event, Emitter<ThemeState> emit) async {
    await setTheme(event.theme);
    emit(ThemeLoaded(event.theme));
  }
}
