import 'package:community/core/widgets/custom_button.dart';
import 'package:community/features/surveys/data/survey_question.dart';
import 'package:community/features/surveys/data/survey.dart';
import 'package:community/features/surveys/presentation/bloc/survey_event.dart';
import 'package:community/features/surveys/presentation/bloc/survey_state.dart';
import 'package:community/features/surveys/presentation/pages/survey_completion_page.dart';
import 'package:community/features/surveys/presentation/widgets/multiple_choice_question.dart';
import 'package:community/features/surveys/presentation/widgets/rating_question.dart';
import 'package:community/features/surveys/presentation/widgets/text_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:community/features/surveys/presentation/bloc/survey_bloc.dart';

class SurveyQuestionPage extends StatefulWidget {
  final String eventId;
  final Survey survey;

  const SurveyQuestionPage({
    super.key,
    required this.eventId,
    required this.survey,
  });

  @override
  State<SurveyQuestionPage> createState() => _SurveyQuestionPageState();
}

class _SurveyQuestionPageState extends State<SurveyQuestionPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextQuestion() {
    if (_currentPage < widget.survey.questions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentPage++;
      });
    } else {
      // Submit the survey
      final surveyBloc = context.read<SurveyBloc>();
      surveyBloc.add(SubmitSurvey(
        eventId: widget.eventId,
        surveyId: widget.survey.id,
      ));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SurveyCompletionPage(eventId: widget.eventId),
        ),
      );
    }
  }

  void _previousQuestion() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyBloc, SurveyState>(
      listener: (context, state) {
        if (state is SurveyError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is! SurveyLoaded) {
          return Scaffold(
            appBar: AppBar(title: const Text('Survey')),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        final questions = widget.survey.questions;
        final currentAnswers = state.answers;

        return PopScope(
          canPop: false,
          onPopInvokedWithResult: (bool didPop, Object? result) async {
            // If already popped, don't show dialog
            if (didPop) {
              return;
            }

            // Show confirmation dialog
            final bool shouldPop = await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Quit Survey?'),
                content: const Text('Progress will be lost if you quit now.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('CONTINUE SURVEY'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('QUIT'),
                  ),
                ],
              ),
            );

            if (context.mounted && shouldPop) {
              Navigator.pop(context);
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Survey Questions'),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            body: Column(
              children: [
                // Progress indicator
                LinearProgressIndicator(
                  value: (_currentPage + 1) / questions.length,
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Question ${_currentPage + 1} of ${questions.length}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),

                // Questions
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      final question = questions[index];

                      switch (question.questionType) {
                        case QuestionType.multipleChoice:
                          return MultipleChoiceQuestion(
                            question: question,
                            selectedOption: currentAnswers[question.id],
                            onOptionSelected: (answer) {
                              context.read<SurveyBloc>().add(
                                    AnswerQuestion(
                                      questionId: question.id,
                                      answer: answer,
                                    ),
                                  );
                            },
                          );
                        case QuestionType.rating:
                          return RatingQuestion(
                            question: question,
                            rating: currentAnswers[question.id] ?? 0,
                            onRatingChanged: (rating) {
                              context.read<SurveyBloc>().add(
                                    AnswerQuestion(
                                      questionId: question.id,
                                      answer: rating,
                                    ),
                                  );
                            },
                          );
                        case QuestionType.text:
                          return TextQuestion(
                            question: question,
                            text: currentAnswers[question.id] ?? '',
                            onTextChanged: (text) {
                              context.read<SurveyBloc>().add(
                                    AnswerQuestion(
                                      questionId: question.id,
                                      answer: text,
                                    ),
                                  );
                            },
                          );
                      }
                    },
                  ),
                ),

                // Navigation buttons
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_currentPage > 0)
                        CustomButton(
                          onPressed: _previousQuestion,
                          text: 'Previous',
                        )
                      else
                        const SizedBox(),
                      CustomButton(
                        onPressed: () {
                          final currentQuestion = questions[_currentPage];
                          final answer = currentAnswers[currentQuestion.id];

                          // Check if question is required and has an answer
                          if (currentQuestion.isRequired &&
                              (answer == null ||
                                  (answer is String && answer.isEmpty) ||
                                  (answer is int && answer == 0))) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please answer this question before continuing'),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }

                          _nextQuestion();
                        },
                        text: _currentPage < questions.length - 1
                            ? 'Next'
                            : 'Submit',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
