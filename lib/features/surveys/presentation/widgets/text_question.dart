// text_question.dart
import 'package:community/features/surveys/data/survey_question.dart';
import 'package:flutter/material.dart';

class TextQuestion extends StatefulWidget {
  final SurveyQuestion question;
  final String text;
  final Function(String) onTextChanged;
  
  const TextQuestion({
    super.key,
    required this.question,
    required this.text,
    required this.onTextChanged,
  });
  
  @override
  State<TextQuestion> createState() => _TextQuestionState();
}

class _TextQuestionState extends State<TextQuestion> {
  late final TextEditingController _controller;
  
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }
  
  @override
  void didUpdateWidget(covariant TextQuestion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.text != _controller.text) {
      _controller.text = widget.text;
    }
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question.text,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (widget.question.isRequired)
            const Text(
              '* Required',
              style: TextStyle(color: Colors.red),
            ),
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              hintText: 'Enter your answer here',
              border: OutlineInputBorder(),
            ),
            maxLines: 5,
            onChanged: widget.onTextChanged,
          ),
        ],
      ),
    );
  }
}