import 'package:community/features/community/presentation/bloc/community_bloc.dart';
import 'package:community/features/community/presentation/widgets/community_post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestCommunityPostsWidget extends StatelessWidget {
  const LatestCommunityPostsWidget({super.key});

  @override
  LatestCommunityPostsWidgetState createState() =>
      LatestCommunityPostsWidgetState();
}

class LatestCommunityPostsWidgetState
    extends State<LatestCommunityPostsWidget> {
  late AppwriteService _appwriteService;
  List<PostModel> _posts = [];
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _appwriteService = AppwriteService();
    _fetchLatestPosts();
  }


  Future<void> _fetchLatestPosts() async {
  try {
    final response = await _appwriteService.listDocuments(
      collectionId: "posts",
    );

    if (!mounted) return;
    
    final List<dynamic> jsonData = response['documents'];
    for (var json in jsonData) {
      print('Post: ${json['postTitle']}, Poll Q: ${json['pollQuestion']}, Options: ${json['pollOptions']}');
    }

    // Sort by date if available (assumes you have an 'updatedAt' field in the API response)
    final sortedPosts = jsonData
      ..sort((a, b) => DateTime.parse(b['updatedAt'])
          .compareTo(DateTime.parse(a['updatedAt'])));

    // Limit to 5 latest posts
    setState(() {
      _posts = sortedPosts
          .take(5)
          .map((json) => PostModel.fromJson(json))
          .toList();
      _isLoading = false;
    });
  } catch (e) {
    if (!mounted) return;
    
    setState(() {
      _hasError = true;
      _isLoading = false;
    });
    
  }
}

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