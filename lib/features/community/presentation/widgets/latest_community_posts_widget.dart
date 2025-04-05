import 'package:community/features/community/presentation/widgets/community_post_card.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/http_appwrite_service.dart';
import '../../data/models/post_model.dart';

class LatestCommunityPostsWidget extends StatefulWidget {
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

    // Sort by date if available (assumes you have an 'updatedAt' field in the API response)
    final sortedPosts = jsonData
      ..sort((a, b) => DateTime.parse(b['updatedAt'])
          .compareTo(DateTime.parse(a['updatedAt'])));

    // Limit to 5 latest posts
    setState(() {
      _posts = sortedPosts
          .take(5)
          .map((json) => PostModel.fromMap(json))
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
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : _hasError
            ? const Center(child: Text('Failed to load posts.'))
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  final post = _posts[index];
                  return CommunityPostCard(post: post);
                },
              );
  }
}
