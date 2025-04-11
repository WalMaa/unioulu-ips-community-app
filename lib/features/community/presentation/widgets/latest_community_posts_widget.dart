import 'package:community/features/community/presentation/bloc/community_bloc.dart';
import 'package:community/features/community/presentation/widgets/community_post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestCommunityPostsWidget extends StatelessWidget {
  const LatestCommunityPostsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Dispatch an event to fetch latest posts when the widget is built
    // We'll add a special parameter to indicate we only want the latest posts
    context.read<CommunityBloc>().add(
          FetchCommunityPosts(limit: 5, sortByLatest: true),
        );

    return BlocBuilder<CommunityBloc, CommunityState>(
      builder: (context, state) {
        if (state is CommunityLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CommunityError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is CommunityLoaded) {
          final posts = state.posts;
          
          if (posts.isEmpty) {
            return const Center(child: Text('No posts available'));
          }
          
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length > 5 ? 5 : posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return CommunityPostCard(post: post);
            },
          );
        }
        
        // Fallback - shouldn't reach here normally
        return const Center(child: Text('Loading posts...'));
      },
    );
  }
}