import '../entities/language_entity.dart';

abstract class LanguageRepository {
  Future<void> setLanguage(LanguageEntity language);
  Future<LanguageEntity> getSavedLanguage();
  Future<List<LanguageEntity>> getLanguages();
}
