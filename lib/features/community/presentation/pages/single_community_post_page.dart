import 'package:community/core/services/dependency_injection.dart';
import 'package:community/core/theme/theme_constants.dart';
import 'package:community/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:community/features/community/presentation/bloc/community_bloc.dart';
import 'package:community/features/community/presentation/widgets/comment_input_field.dart';
import 'package:community/features/community/presentation/widgets/comment_section.dart';
import 'package:community/features/community/service/community_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Post'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPostCard(context, post),
            CommentInputField(
              postId: post.id,
              onCommentSubmit: (postId, commentText) {
                context.read<CommunityBloc>().add(
                      AddComment(
                        postId: postId,
                        commentText: commentText,
                      ),
                    );
              },
            ),
            CommentsSection(postId: post.id),
          ],
        ),
      ),
    );
  }

  // Main post card
  Widget _buildPostCard(BuildContext context, PostModel post) {
    return BlocBuilder<CommunityBloc, CommunityState>(
      buildWhen: (previous, current) {
        return (current is PostLoaded) || (current is CommunityActionSuccess);
      },
      builder: (context, state) {
        // Get updated post data if available
        final currentPost = (state is PostLoaded) ? state.post : post;
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
            // Like button row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        currentPost.isLiked
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: currentPost.isLiked ? Colors.red : null,
                      ),
                      onPressed: () {
                        context.read<CommunityBloc>().add(
                              TogglePostLike(postId: currentPost.id),
                            );
                      },
                    ),
                    Text('${currentPost.likeCount}'),
                  ],
                ),
                const SizedBox(width: AppSpacing.smallPadding),
              ],
            ),
          ],
        );
      },
    );
  }
}
