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

  Future<List<SurveyQuestion>> getQuestionsForSurvey(String surveyId) async {
    try {
      final response = await _appwriteService.listDocuments(
          collectionId: "survey_questions",
          queries: [Query.equal('surveyId', surveyId)]);

      if (response['documents'].isNotEmpty) {
        final questionsData = response['documents'];
        List<SurveyQuestion> questions = questionsData
            .map<SurveyQuestion>((question) => SurveyQuestion.fromMap(question))
            .toList();
        return questions;
      } else {
        throw Exception('No questions found for survey $surveyId');
      }
    } catch (e) {
      developer.log('Error fetching questions for survey $surveyId: $e',
          error: e, stackTrace: StackTrace.current);
    }
    return [];
  }

  Future<Survey> getSurveyForEvent(String eventId) async {
    final response = await _appwriteService.listDocuments(
        collectionId: "surveys", queries: [Query.equal('eventId', eventId)]);

    if (response['documents'].isNotEmpty) {
      final surveyData = response['documents'][0];
      Survey survey = Survey.fromMap(surveyData);
      List<SurveyQuestion> questions = await getQuestionsForSurvey(survey.id);
      survey.questions = questions;
      return survey;
    } else {
      throw Exception('No survey found for event $eventId');
    }
  }

  Future<void> submitSurveyResponse(SurveyResponse responseModel) async {
    await _appwriteService
        .createDocument(collectionId: "survey_responses", data: {
      'documentId': 'unique()',
      'data': {
        'eventId': responseModel.eventId,
        'surveyId': responseModel.surveyId,
      }
    });
  }
}
