

import 'package:community/features/surveys/data/question.dart';
import 'package:community/features/surveys/data/survey.dart';
import 'package:community/features/surveys/data/survey_response.dart';

class SurveyService {
  
  SurveyService();
  
  Future<Survey> getSurveyForEvent(String eventId) async {
    // TODO: Replace with actual API call

    var questions = [
      Question(
        id: '1',
        text: 'How would you rate the event?',
        type: QuestionType.rating,
        options: ['1', '2', '3', '4', '5'],
      ),
      Question(
        id: '2',
        text: 'What did you like most about the event?',
        type: QuestionType.text,
      ),
    ];

    Survey survey = Survey(
      id: '1',
      title: 'Sample Survey',
      description: 'This is a sample survey description.',
      eventId: eventId,
      questions: questions,
    );
    return Future(() => survey);
  }
  
  Future<void> submitSurveyResponse(SurveyResponse responseModel) async {
    // TODO: Replace with actual API call
    // Simulate a network call
    await Future.delayed(Duration(seconds: 1));
    
  }
}