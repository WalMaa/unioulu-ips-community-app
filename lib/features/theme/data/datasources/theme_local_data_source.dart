import 'package:isar/isar.dart';
import '../../../../core/theme/app_theme.dart';
import '../models/theme_model.dart';

abstract class ThemeLocalDataSource {
  Future<ThemeModel> getTheme();
  Future<void> setTheme(ThemeModel themeModel);
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  final Isar isar;

  ThemeLocalDataSourceImpl(this.isar);

  @override
  Future<ThemeModel> getTheme() async {
    final theme = await isar.themeModels.where().findFirst();
    return theme ?? ThemeModel(AppTheme.Light);
  }

  @override
  Future<void> setTheme(ThemeModel themeModel) async {
    await isar.writeTxn(() async {
      await isar.themeModels.clear();
      await isar.themeModels.put(themeModel);
    });
  }
}
