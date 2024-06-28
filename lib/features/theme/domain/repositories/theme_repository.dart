import '../../../../core/theme/app_theme.dart';

abstract class ThemeRepository {
  Future<AppTheme> getTheme();
  Future<void> setTheme(AppTheme theme);
}
