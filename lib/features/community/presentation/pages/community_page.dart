import 'package:community/features/community/presentation/widgets/community_post_card.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/http_appwrite_service.dart';
import '../../data/models/post_model.dart';
import '../widgets/add_community_post.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  CommunityPageState createState() => CommunityPageState();
}

class CommunityPageState extends State<CommunityPage> {
  late AppwriteService _appwriteService;

  @override
  void initState() {
    super.initState();
    _appwriteService = AppwriteService();
  }

  Future<List<PostModel>> _fetchPosts() async {
    final response = await _appwriteService.listDocuments(
      collectionId: 'posts',
    );

      final List<dynamic> jsonData = response['documents'];
      return jsonData.map((json) => PostModel.fromJson(json)).toList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: _fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No posts available'));
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return CommunityPostCard(post: post);
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CommunityPostForm(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
