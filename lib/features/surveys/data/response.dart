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

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
      questionId: map['questionId'],
      answer: map['answer'],
    );
  }
}
