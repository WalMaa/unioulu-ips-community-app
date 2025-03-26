
import 'package:community/core/services/dependency_injection.dart';
import 'package:community/core/theme/theme_constants.dart';
import 'package:community/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:community/features/community/presentation/bloc/community_bloc.dart';
import 'package:community/features/community/service/community_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/comment_model.dart';
import '../../data/models/post_model.dart';

class SingleCommunityPostPage extends StatelessWidget {
  const SingleCommunityPostPage({
    super.key,
    required this.post, // Pass PostModel object
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityBloc(
        communityService: locator<CommunityService>(),
        authRepository: locator<AuthRepositoryImpl>(),
      )..add(LoadSinglePost(post: post)),
      child: SingleCommunityPostPageView(post: post),
    );
  }
}

class SingleCommunityPostPageView extends StatelessWidget {
  const SingleCommunityPostPageView({
    Key? key,
    required this.post,
  }) : super(key: key);

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommunityBloc, CommunityState>(
      listenWhen: (previous, current) {
        // Listen for these state changes
        return current is CommunityError || 
               current is CommentAdded || 
               current is CommunityActionSuccess;
      },
      listener: (context, state) {
        // Handle states that trigger UI feedback
        if (state is CommunityError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        } else if (state is CommentAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.green),
          );
        } else if (state is CommunityActionSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.green),
          );
        }
      },
      builder: (context, state) {
        // Handle the actual UI building based on state
        return Scaffold(
          appBar: AppBar(
            title: const Text('Community Post'),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Main post (this should remain the same regardless of state)
                _buildPostCard(context, post),
                
                // Comments section - dynamic based on state
                _buildCommentsSection(context, state),
              ],
            ),
          ),
        );
      },
    );
  }
  
  // Main post card
  Widget _buildPostCard(BuildContext context, PostModel post) {
    return Column(
      children: [
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
                      backgroundImage: NetworkImage('https://thispersondoesnotexist.com/'),
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
        // Like button row
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    post.isLiked ? Icons.favorite : Icons.favorite_border,
                    color: post.isLiked ? Colors.red : null,
                  ),
                  onPressed: () {
                    context.read<CommunityBloc>().add(
                          ToggleLike(postId: post.id),
                        );
                  },
                ),
                Text('${post.likeCount}'),
              ],
            ),
            const SizedBox(width: AppSpacing.smallPadding),
          ],
        ),
      ],
    );
  }
  
  // Comments section
  Widget _buildCommentsSection(BuildContext context, CommunityState state) {
    final comments = state is CommentsLoaded 
        ? state.comments 
        : <CommentModel>[];
    
    final isLoading = state is CommentsLoading;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        // Comment input field
        _buildCommentInput(context),
        
        const SizedBox(height: 16),
        // Comments header
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Comments',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        
        // Comments list or loading indicator
        if (isLoading)
          const Center(child: CircularProgressIndicator())
        else if (comments.isEmpty)
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: Text('No comments yet. Be the first to comment!')),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: comments.length,
            itemBuilder: (context, index) {
              final comment = comments[index];
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
            },
          ),
      ],
    );
  }
  
  // Comment input box
  Widget _buildCommentInput(BuildContext context) {
    final commentController = TextEditingController();
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 100,
              child: TextFormField(
                controller: commentController,
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
          CustomButton(
            onPressed: () {
              final comment = commentController.text.trim();
              if (comment.isNotEmpty) {
                context.read<CommunityBloc>().add(
                      AddComment(
                        postId: post.id,
                        commentText: comment,
                      ),
                    );
                commentController.clear();
              }
            },
            text: 'Post',
          ),
        ],
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
