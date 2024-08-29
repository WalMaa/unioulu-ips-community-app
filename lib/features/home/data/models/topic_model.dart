import 'package:isar/isar.dart';

part 'topic_model.g.dart';

@Collection()
class TopicModel {
  Id id = Isar.autoIncrement;
  late String textEn;
  late String textFi;
  late String textSv;
  late String icon;

  TopicModel({
    required this.textEn,
    required this.textFi,
    required this.textSv,
    required this.icon,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      textEn: json['text_en'] ?? '',
      textFi: json['text_fi'] ?? '',
      textSv: json['text_sv'] ?? '',
      icon: json['icon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text_en': textEn,
      'text_fi': textFi,
      'text_sv': textSv,
      'icon': icon,
    };
  }
}
