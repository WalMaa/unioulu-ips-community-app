import '../entities/language_entity.dart';
import '../repositories/language_repository.dart';

class GetSavedLanguage {
  final LanguageRepository repository;

  GetSavedLanguage(this.repository);

  Future<LanguageEntity> call() async {
    return await repository.getSavedLanguage();
  }
}
