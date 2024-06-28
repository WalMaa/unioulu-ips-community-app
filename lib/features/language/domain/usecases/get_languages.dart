import '../entities/language_entity.dart';
import '../repositories/language_repository.dart';

class GetLanguages {
  final LanguageRepository repository;

  GetLanguages(this.repository);

  Future<List<LanguageEntity>> call() async {
    return await repository.getLanguages();
  }
}
