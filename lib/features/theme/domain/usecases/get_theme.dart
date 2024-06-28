import '../../../../core/theme/app_theme.dart';
import '../repositories/theme_repository.dart';

class GetTheme {
  final ThemeRepository repository;

  GetTheme(this.repository);

  Future<AppTheme> call() async {
    return await repository.getTheme();
  }
}
