enum QuestionType {
  multipleChoice,
  rating,
  text
}

class Question {
  final String id;
  final String text;
  final QuestionType type;
  final List<String>? options;
  final bool isRequired;
  
  Question({
    required this.id,
    required this.text,
    required this.type,
    this.options,
    this.isRequired = true,
  });

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      id: map['id'] ?? '',
      text: map['text'] ?? '',
      type: QuestionType.values[map['type']],
      options: List<String>.from(map['options'] ?? []),
      isRequired: map['isRequired'] ?? true,
    );
  }

}
