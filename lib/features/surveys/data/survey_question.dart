enum QuestionType {
  multipleChoice,
  rating,
  text
}

class SurveyQuestion {
  final String id;
  final String text;
  final QuestionType type;
  final List<String>? options;
  final bool isRequired;
  
  SurveyQuestion({
    required this.id,
    required this.text,
    required this.type,
    this.options,
    this.isRequired = true,
  });

  factory SurveyQuestion.fromMap(Map<String, dynamic> map) {
    return SurveyQuestion(
      id: map['id'] ?? '',
      text: map['text'] ?? '',
      type: QuestionType.values[map['type']],
      options: List<String>.from(map['options'] ?? []),
      isRequired: map['isRequired'] ?? true,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'type': type.index,
      'options': options,
      'isRequired': isRequired,
    };
  }

  @override
  String toString() {
    return 'Question{id: $id, text: $text, type: $type, options: $options, isRequired: $isRequired}';
  }
}
