import 'package:community/features/surveys/data/survey_question.dart';
import 'package:flutter/material.dart';

class MultipleChoiceQuestion extends StatelessWidget {
  final SurveyQuestion question;
  final String? selectedOption;
  final Function(String) onOptionSelected;
  
  const MultipleChoiceQuestion({
    Key? key,
    required this.question,
    required this.selectedOption,
    required this.onOptionSelected,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (question.isRequired)
            const Text(
              '* Required',
              style: TextStyle(color: Colors.red),
            ),
          const SizedBox(height: 16),
          ...question.options!.map((option) => RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: selectedOption,
            onChanged: (value) {
              if (value != null) {
                onOptionSelected(value);
              }
            },
          )),
        ],
      ),
    );
  }
}