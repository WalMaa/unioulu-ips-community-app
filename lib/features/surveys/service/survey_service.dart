

import 'dart:developer' as developer;

import 'package:appwrite/appwrite.dart';
import 'package:community/core/services/http_appwrite_service.dart';
import 'package:community/features/surveys/data/survey_question.dart';
import 'package:community/features/surveys/data/survey.dart';
import 'package:community/features/surveys/data/survey_response.dart';

class SurveyService {
  final AppwriteService _appwriteService;

  SurveyService({required AppwriteService appwriteService}) 
    : _appwriteService = appwriteService;
  
  
  Future<Survey> getSurveyForEvent(String eventId) async {

    try {
      final response = await _appwriteService.listDocuments(
        collectionId: "surveys", 
        queries: [ Query.equal('eventId', eventId)] );

      if (response['documents'].isNotEmpty) {
        final surveyData = response['documents'][0];
        return Survey.fromMap(surveyData);
      } else {
        throw Exception('No survey found for event $eventId');
      }
    } catch (e) {
      developer.log('Error fetching survey for event $eventId: $e',
          error: e, stackTrace: StackTrace.current);
    }

    var questions = [
      SurveyQuestion(
        id: '1',
        text: 'How would you rate the event?',
        type: QuestionType.rating,
        options: ['1', '2', '3', '4', '5'],
      ),
      SurveyQuestion(
        id: '2',
        text: 'What did you like most about the event?',
        type: QuestionType.text,
      ),
      SurveyQuestion(
        id: '3',
        text: 'Would you recommend this event to a friend?',
        type: QuestionType.multipleChoice,
        options: ['Yes', 'No', 'Maybe'],
      ),
    ];

    Survey survey = Survey(
      id: '1',
      title: 'Sample Survey',
      description: 'This is a sample survey description.',
      eventId: eventId,
      questions: questions,
    );
    return survey;
  }
  
  Future<void> submitSurveyResponse(SurveyResponse responseModel) async {
    // TODO: Replace with actual API call
    // Simulate a network call
    await Future.delayed(Duration(seconds: 1));
    
  }
}