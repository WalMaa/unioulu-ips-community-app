import 'package:isar/isar.dart';
import '../../domain/entities/language_entity.dart';
import '../models/language_model.dart';

abstract class LanguageLocalDataSource {
  Future<void> setLanguage(LanguageModel language);
  Future<LanguageEntity> getSavedLanguage();
  Future<List<LanguageEntity>> getLanguages();
}

class LanguageLocalDataSourceImpl implements LanguageLocalDataSource {
  final Isar isar;

  LanguageLocalDataSourceImpl(this.isar);

  @override
  Future<void> setLanguage(LanguageModel language) async {
    // Clear the existing saved language before saving the new one
    await isar.writeTxn(() async {
      await isar.languageModels.clear();
      await isar.languageModels.put(language);
    });
  }

  @override
  Future<LanguageEntity> getSavedLanguage() async {
    final languageModel = await isar.languageModels.where().findFirst();
    if (languageModel != null) {
      return LanguageEntity(
        language: languageModel.language,
        subLanguage: languageModel.subLanguage,
        languageCode: languageModel.languageCode,
      );
    } else {
      return LanguageEntity(
          language: 'English', subLanguage: 'en', languageCode: 'en');
    }
  }

  @override
  Future<List<LanguageEntity>> getLanguages() async {
    // Return a hardcoded list of languages
    return [
      LanguageEntity(
          language: 'English', subLanguage: 'en', languageCode: 'en'),
      LanguageEntity(
          language: 'Finnish', subLanguage: 'fi', languageCode: 'fi'),
      LanguageEntity(
          language: 'Swedish', subLanguage: 'sv', languageCode: 'sv'),
    ];
  }
}
