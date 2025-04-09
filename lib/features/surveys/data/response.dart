class Response {
  final String questionId;
  final dynamic answer;
  
  Response({
    required this.questionId,
    required this.answer,
  });

  Map<String, dynamic> toMap() {
    return {
      'questionId': questionId,
      'answer': answer,
    };
  }
}
