import 'package:equatable/equatable.dart';

abstract class SurveyEvent extends Equatable {
  const SurveyEvent();

  @override
  List<Object> get props => [];
}

class LoadSurvey extends SurveyEvent {
  final String eventId;
  
  const LoadSurvey({required this.eventId});
  
  @override
  List<Object> get props => [eventId];
}

class AnswerQuestion extends SurveyEvent {
  final String questionId;
  final dynamic answer;
  
  const AnswerQuestion({
    required this.questionId,
    required this.answer,
  });
  
  @override
  List<Object> get props => [questionId, answer];
}

class SubmitSurvey extends SurveyEvent {
  final String eventId;
  final String surveyId;
  
  const SubmitSurvey({
    required this.eventId,
    required this.surveyId,
  });
  
  @override
  List<Object> get props => [eventId, surveyId];
}