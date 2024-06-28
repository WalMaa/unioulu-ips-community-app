import 'package:isar/isar.dart';
import '../../domain/entities/language_entity.dart';

part 'language_model.g.dart';

@Collection()
class LanguageModel extends LanguageEntity {
  Id id = Isar.autoIncrement;

  @override
  @Index()
  final String language;
  @override
  final String subLanguage;
  @override
  final String languageCode;

  LanguageModel({
    required this.language,
    required this.subLanguage,
    required this.languageCode,
  }) : super(
            language: language,
            subLanguage: subLanguage,
            languageCode: languageCode);

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      language: json['language'],
      subLanguage: json['subLanguage'],
      languageCode: json['languageCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'language': language,
      'subLanguage': subLanguage,
      'languageCode': languageCode,
    };
  }

  static List<LanguageModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((json) => LanguageModel.fromJson(json)).toList();
  }
}
