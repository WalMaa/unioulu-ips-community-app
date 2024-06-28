import '../../../../core/theme/app_theme.dart';
import '../../domain/repositories/theme_repository.dart';
import '../datasources/theme_local_data_source.dart';
import '../models/theme_model.dart';

class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDataSource localDataSource;

  ThemeRepositoryImpl(this.localDataSource);

  @override
  Future<AppTheme> getTheme() async {
    final themeModel = await localDataSource.getTheme();
    return themeModel.theme;
  }

  @override
  Future<void> setTheme(AppTheme theme) async {
    final themeModel = ThemeModel(theme);
    await localDataSource.setTheme(themeModel);
  }
}
