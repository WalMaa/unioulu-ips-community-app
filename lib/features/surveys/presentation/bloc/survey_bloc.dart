import 'dart:developer' as developer;
import 'package:bloc/bloc.dart';
import 'package:community/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:community/features/surveys/data/response.dart';
import 'package:community/features/surveys/data/survey_response.dart';
import 'package:community/features/surveys/presentation/bloc/survey_event.dart';
import 'package:community/features/surveys/presentation/bloc/survey_state.dart';
import 'package:community/features/surveys/service/survey_service.dart';

class SurveyBloc extends Bloc<SurveyEvent, SurveyState> {
  final AuthRepositoryImpl authRepository;
  final SurveyService service;
  
  SurveyBloc({
    required this.authRepository,
    required this.service,
  }) : super(SurveyInitial()) {
    on<LoadSurvey>(_onLoadSurvey);
    on<AnswerQuestion>(_onAnswerQuestion);
    on<SubmitSurvey>(_onSubmitSurvey);
  }
  
  Future<void> _onLoadSurvey(LoadSurvey event, Emitter<SurveyState> emit) async {
    emit(SurveyLoading());
    try {
      final survey = await service.getSurveyForEvent(event.eventId);
      developer.log('Survey loaded: ${survey.toString()}');
      emit(SurveyLoaded(
        survey: survey,
        answers: {},
      ));
    } catch (e) {
      emit(SurveyError(message: e.toString()));
    }
  }
  
  void _onAnswerQuestion(AnswerQuestion event, Emitter<SurveyState> emit) {
    final currentState = state;
    if (currentState is SurveyLoaded) {
      final updatedAnswers = Map<String, dynamic>.from(currentState.answers);
      updatedAnswers[event.questionId] = event.answer;
      
      emit(currentState.copyWith(answers: updatedAnswers));
    }
  }
  
  Future<void> _onSubmitSurvey(SubmitSurvey event, Emitter<SurveyState> emit) async {
    final currentState = state;
    if (currentState is SurveyLoaded) {
      emit(SurveySubmitting());
      
      try {
        final userId = await authRepository.getCurrentUserId();
        
        final responses = currentState.answers.entries.map((entry) {
          return Response(
            questionId: entry.key,
            answer: entry.value,
          );
        }).toList();
        
        final surveyResponse = SurveyResponse(
          surveyId: event.surveyId,
          userId: userId,
          eventId: event.eventId,
          responses: responses,
          submittedAt: DateTime.now(),
        );
        
        await service.submitSurveyResponse(surveyResponse);
        emit(const SurveySubmitted(message: 'Thank you for your feedback!'));
      } catch (e) {
        emit(SurveyError(message: 'Failed to submit survey: ${e.toString()}'));
      }
    }
  }
}