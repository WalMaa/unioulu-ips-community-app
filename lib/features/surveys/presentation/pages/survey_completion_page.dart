import 'package:community/features/surveys/presentation/bloc/survey_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:community/features/surveys/presentation/bloc/survey_bloc.dart';

class SurveyCompletionPage extends StatelessWidget {
  final String eventId;
  
  const SurveyCompletionPage({Key? key, required this.eventId}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyBloc, SurveyState>(
      listener: (context, state) {
        if (state is SurveyError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        String message = 'Thank you for completing the survey!';
        bool isSubmitting = false;
        
        if (state is SurveySubmitting) {
          message = 'Submitting your responses...';
          isSubmitting = true;
        } else if (state is SurveySubmitted) {
          message = state.message;
        }
        
        return Scaffold(
          appBar: AppBar(
            title: const Text('Survey Complete'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isSubmitting)
                    const CircularProgressIndicator()
                  else
                    const Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 100,
                    ),
                  const SizedBox(height: 24),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(
                        context, 
                        (route) => route.isFirst || route.settings.name == '/event_detail',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: const Text('Return to Event'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}