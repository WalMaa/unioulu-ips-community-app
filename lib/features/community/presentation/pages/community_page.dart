import 'package:community/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:community/features/community/presentation/bloc/community_bloc.dart';
import 'package:community/features/community/presentation/widgets/community_post_card.dart';
import 'package:community/features/community/service/community_service.dart';
import 'package:community/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/add_community_post.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityBloc(
        communityService: locator<CommunityService>(),
        authRepository: locator<AuthRepositoryImpl>(),
      )..add(const FetchCommunityPosts()), // Trigger loading when page is created
      child: const CommunityView(),
    );
  }
}

class CommunityView extends StatelessWidget {
  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Refresh posts when the refresh button is tapped
              context.read<CommunityBloc>().add(const FetchCommunityPosts());
            },
          ),
        ],
      ),
      body: BlocBuilder<CommunityBloc, CommunityState>(
        builder: (context, state) {
          if (state is CommunityLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CommunityError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is CommunityLoaded) {
            if (state.posts.isEmpty) {
              return const Center(child: Text('No posts available'));
            }
            return RefreshIndicator(
              onRefresh: () async {
                context.read<CommunityBloc>().add(const FetchCommunityPosts());
                // Wait for the state to change to either Loaded or Error
                return Future.delayed(const Duration(seconds: 1));
              },
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return CommunityPostCard(
                    post: post,
                    
                  );
                },
              ),
            );
          }
          // Handle initial state
          return const Center(child: Text('Loading community...'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CommunityPostForm(),
            ),
          ).then((_) {
            // Refresh the posts when returning from the form
            context.read<CommunityBloc>().add(const FetchCommunityPosts());
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}