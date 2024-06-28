import 'package:isar/isar.dart';

import '../../../../core/theme/app_theme.dart';

part 'theme_model.g.dart';

@Collection()
class ThemeModel {
  Id id = Isar.autoIncrement;

  @Enumerated(EnumType.name)
  final AppTheme theme;

  ThemeModel(this.theme);

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(AppTheme.values[json['theme']]);
  }

  Map<String, dynamic> toJson() {
    return {'theme': theme.index};
  }
}
