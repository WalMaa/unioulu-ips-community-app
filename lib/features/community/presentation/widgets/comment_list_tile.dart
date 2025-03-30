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
            _formatDateTime(comment.dateTime),
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

String _formatDateTime(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inSeconds < 60) {
    return 'just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minutes ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hours ago';
  } else if (difference.inDays < 30) {
    return '${difference.inDays} days ago';
  } else if (difference.inDays < 365) {
    return '${difference.inDays ~/ 30} months ago';
  } else {
    return '${difference.inDays ~/ 365} years ago';
  }
}
