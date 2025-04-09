import 'package:community/features/surveys/data/survey_question.dart';
import 'package:flutter/material.dart';

class RatingQuestion extends StatelessWidget {
  final SurveyQuestion question;
  final int rating;
  final Function(int) onRatingChanged;
  
  const RatingQuestion({
    Key? key,
    required this.question,
    required this.rating,
    required this.onRatingChanged,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.questionText,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (question.isRequired)
            const Text(
              '* Required',
              style: TextStyle(color: Colors.red),
            ),
          const SizedBox(height: 24),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                final value = index + 1;
                return IconButton(
                  iconSize: 40,
                  icon: Icon(
                    value <= rating ? Icons.star : Icons.star_border,
                    color: value <= rating ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () => onRatingChanged(value),
                );
              }),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              rating > 0 ? '$rating / 5' : 'Please rate',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}