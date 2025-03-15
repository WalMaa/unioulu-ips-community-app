import 'dart:developer' as developer;

import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/button.dart';
import '../../../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../../../core/services/http_appwrite_service.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../data/models/comment_model.dart';
import '../../data/models/post_model.dart';

class SingleCommunityPostPage extends StatefulWidget {
  const SingleCommunityPostPage({
    super.key,
    required this.post, // Pass PostModel object
  });

  final PostModel post;

  @override
  SingleCommunityPostPageState createState() => SingleCommunityPostPageState();
}

class SingleCommunityPostPageState extends State<SingleCommunityPostPage> {
  final TextEditingController _commentController = TextEditingController();
  late List<CommentModel> _comments = [];

  // Function to fetch comments for the post
  Future<void> _fetchComments() async {
    developer.log('Fetching comments for post: ${widget.post.id}');
    final appwriteService = AppwriteService();

    //TODO: Add a filter to only fetch comments for the current post
    final response =
        await appwriteService.listDocuments(collectionId: "comments", queries: [
      Query.equal('postId', widget.post.id),
    ]);

    final List<dynamic> jsonData = response['documents'];
    setState(() {
      _comments = jsonData.map((json) => CommentModel.fromJson(json)).toList();
    });
  }

  // Function to add a comment
  void _addComment() async {
    if (_commentController.text.isNotEmpty) {
      final authState = context.read<AuthBloc>().state;
      final username =
          authState is AuthAuthenticated ? authState.user.name : 'Anonymous';

      final newComment = CommentModel(
        text: _commentController.text,
        username: username,
        dateTime: DateTime.now(),
        postId: widget.post.id, // Add this line
      );

      // Submit the new comment to the Appwrite comments collection
      final appwriteService = AppwriteService();
      final response = await appwriteService.createDocument(
        collectionId: "comments",
        documentId: 'unique()',
        data: {
          'documentId': 'unique()',
          "data": newComment.toJson(),
        },
      );

      if (response.isNotEmpty) {
        setState(() {
          _comments.add(newComment);
        });
        _commentController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to add comment')),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchComments(); // Fetch comments when the page loads
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Post'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Post Section
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.all(12),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(
                              'https://thispersondoesnotexist.com/'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.authorName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                post.authorTitle,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    if (post.imageUrl.isNotEmpty)
                      Image.network(
                        post.imageUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    const SizedBox(height: 16),
                    Text(
                      post.postTitle,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      post.content,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Comment Input Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 100, // Adjust as needed
                      child: TextFormField(
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
                  ),
                  const SizedBox(width: 8),
                  Button(
                    onPressed: _addComment,
                    text: 'Post',
                  ),

                ],
              ),
            ),
            const SizedBox(height: 16),
            // Comment Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Comments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                final comment = _comments[index];
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        NetworkImage('https://thispersondoesnotexist.com/'),
                  ),
                  title: Row(
                    children: [
                      Text(comment.username),
                      const Spacer(),
                      Text(
                        // Format the date time to a more readable format just now, 10 minutes ago, 1 hour ago, 2 hours ago, etc.

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
              },
            ),
          ],
        ),
      ),
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
