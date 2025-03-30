import 'package:community/core/utils/format_date.dart';
import 'package:community/features/community/data/models/comment_model.dart';
import 'package:flutter/material.dart';

class CommentListTile extends StatelessWidget {
  final VoidCallback? onLikePressed;
  final CommentModel comment;

  const CommentListTile({
    super.key,
    required this.comment,
    this.onLikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://thispersondoesnotexist.com/'),
      ),
      title: Row(
        children: [
          Text(comment.username),
          const Spacer(),
          Text(
            formatDateTime(comment.dateTime),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
      subtitle: Text(comment.text),
    );
  }
}

