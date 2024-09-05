import 'dart:convert';
import 'package:flutter/material.dart';
import '../../../../core/services/http_appwrite_service.dart';
import '../../data/models/post_model.dart';
import '../pages/community_post.dart';

class LatestCommunityPostsWidget extends StatefulWidget {
  const LatestCommunityPostsWidget({super.key});

  @override
  _LatestCommunityPostsWidgetState createState() =>
      _LatestCommunityPostsWidgetState();
}

class _LatestCommunityPostsWidgetState
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
      final response = await _appwriteService.makeRequest(
        'GET',
        'databases/communitydb/collections/posts/documents',
        null,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body)['documents'];

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
      } else {
        setState(() {
          _isLoading = false;
          _hasError = true;
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
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
                  return CommunityPost(post: post);
                },
              );
  }
}
