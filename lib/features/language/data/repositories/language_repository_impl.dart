import '../../domain/entities/language_entity.dart';
import '../../domain/repositories/language_repository.dart';
import '../datasources/language_local_data_source.dart';
import '../models/language_model.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageLocalDataSource localDataSource;

  LanguageRepositoryImpl(this.localDataSource);

  @override
  Future<List<LanguageEntity>> getLanguages() async {
    return await localDataSource.getLanguages();
  }

  @override
  Future<void> setLanguage(LanguageEntity language) async {
    final languageModel = LanguageModel(
      language: language.language,
      subLanguage: language.subLanguage,
      languageCode: language.languageCode,
    );
    await localDataSource.setLanguage(languageModel);
  }

  @override
  Future<LanguageEntity> getSavedLanguage() async {
    return await localDataSource.getSavedLanguage();
  }
}
