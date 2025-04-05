import 'package:community/features/surveys/data/survey.dart';
import 'package:equatable/equatable.dart';

abstract class SurveyState extends Equatable {
  const SurveyState();
  
  @override
  List<Object> get props => [];
}

class SurveyInitial extends SurveyState {}

class SurveyLoading extends SurveyState {}

class SurveyLoaded extends SurveyState {
  final Survey survey;
  final Map<String, dynamic> answers;
  final int currentQuestionIndex;
  
  const SurveyLoaded({
    required this.survey,
    required this.answers,
    this.currentQuestionIndex = 0,
  });
  
  SurveyLoaded copyWith({
    Survey? survey,
    Map<String, dynamic>? answers,
    int? currentQuestionIndex,
  }) {
    return SurveyLoaded(
      survey: survey ?? this.survey,
      answers: answers ?? this.answers,
      currentQuestionIndex: currentQuestionIndex ?? this.currentQuestionIndex,
    );
  }
  
  @override
  List<Object> get props => [survey, answers, currentQuestionIndex];
}

class SurveySubmitting extends SurveyState {}

class SurveySubmitted extends SurveyState {
  final String message;
  
  const SurveySubmitted({required this.message});
  
  @override
  List<Object> get props => [message];
}

class SurveyError extends SurveyState {
  final String message;
  
  const SurveyError({required this.message});
  
  @override
  List<Object> get props => [message];
}