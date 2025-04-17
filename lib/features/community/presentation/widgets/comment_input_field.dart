import 'package:community/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CommentInputField extends StatefulWidget {
  final String postId;
  final Function(String postId, String commentText) onCommentSubmit;

  const CommentInputField({
    super.key,
    required this.postId,
    required this.onCommentSubmit,
  });

  @override
  State<CommentInputField> createState() => _CommentInputFieldState();
}

class _CommentInputFieldState extends State<CommentInputField> {
  final TextEditingController _commentController = TextEditingController();
  
  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: _commentController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Add a comment...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CustomButton(
            onPressed: () {
              final comment = _commentController.text.trim();
              if (comment.isNotEmpty) {
                // Call the passed function instead of directly accessing the bloc
                widget.onCommentSubmit(widget.postId, comment);
                _commentController.clear();
              }
            },
            text: 'Post',
          ),
        ],
      ),
    );
  }
}