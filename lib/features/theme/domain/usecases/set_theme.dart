import '../../../../core/theme/app_theme.dart';
import '../repositories/theme_repository.dart';

class SetTheme {
  final ThemeRepository repository;

  SetTheme(this.repository);

  Future<void> call(AppTheme theme) async {
    await repository.setTheme(theme);
  }
}
