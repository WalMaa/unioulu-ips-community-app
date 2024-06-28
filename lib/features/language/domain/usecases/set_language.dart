import '../entities/language_entity.dart';
import '../repositories/language_repository.dart';

class SetLanguage {
  final LanguageRepository repository;

  SetLanguage(this.repository);

  Future<void> call(LanguageEntity language) async {
    await repository.setLanguage(language);
  }
}
