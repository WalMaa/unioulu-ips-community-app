import 'package:community/features/community/presentation/bloc/community_bloc.dart';
import 'package:community/features/community/presentation/widgets/community_post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestCommunityPostsWidget extends StatefulWidget {
  const LatestCommunityPostsWidget({super.key});

  @override
  _LatestCommunityPostsWidgetState createState() => _LatestCommunityPostsWidgetState();
}

class _LatestCommunityPostsWidgetState extends State<LatestCommunityPostsWidget> {
  static const int _postLimit = 5;

  @override
  void initState() {
    super.initState();
    context.read<CommunityBloc>().add(
          FetchCommunityPosts(limit: _postLimit, sortByLatest: true),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityBloc, CommunityState>(
      builder: (context, state) {
        if (state is CommunityLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CommunityError) {
          return Center(child: Text('Error: ${state.message}'));
        } else if (state is CommunityLoaded) {
          final posts = state.posts.take(_postLimit).toList();

          if (posts.isEmpty) {
            return const Center(child: Text('No posts available'));
          }

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return CommunityPostCard(post: post);
            },
          );
        }

        // Default placeholder
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
