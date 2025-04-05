import 'package:community/features/surveys/data/response.dart';

class SurveyResponse {
  final String surveyId;
  final String userId;
  final String eventId;
  final List<Response> responses;
  final DateTime submittedAt;
  
  SurveyResponse({
    required this.surveyId,
    required this.userId,
    required this.eventId,
    required this.responses,
    required this.submittedAt,
  });
}