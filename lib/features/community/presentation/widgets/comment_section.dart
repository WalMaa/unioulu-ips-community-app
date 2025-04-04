import 'package:community/features/community/data/models/comment_model.dart';
import 'package:community/features/community/presentation/bloc/community_bloc.dart';
import 'package:community/features/community/presentation/widgets/comment_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsSection extends StatelessWidget {
  final String postId;
  
  const CommentsSection({Key? key, required this.postId}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityBloc, CommunityState>(
      buildWhen: (previous, current) {
        // Only rebuild on states that affect comments
        return current is PostLoaded || 
               current is CommentsLoading;
      },
      builder: (context, state) {
        final comments = state is PostLoaded 
            ? state.comments 
            : <CommentModel>[];
        
        final isLoading = state is CommentsLoading;
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Comments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            
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
                  return CommentListTile(
                    key: ValueKey(comment.id), 
                    comment: comment, 
                    onLikePressed: () {
                      context.read<CommunityBloc>().add(
                        ToggleCommentLike(commentId: comment.id),
                      );
                    },
                  );
                },
              ),
          ],
        );
      },
    );
  }
}