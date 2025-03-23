
import 'package:appwrite/appwrite.dart';
import 'package:community/core/services/http_appwrite_service.dart';

class CommunityService {
  final AppwriteService appwriteService = AppwriteService();

  Future<List<Map<String, dynamic>>> getLatestPosts() async {
    try {
      final response = await appwriteService.listDocuments(
        collectionId: "posts",
      );

      if (response.containsKey('documents') && response['documents'] is List) {
        final documents = response['documents'] as List;
        return documents.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to fetch posts: ${response.toString()}');
      }
    } catch (e) {
      throw Exception('Failed to fetch posts: ${e.toString()}');
    }
  }

  // Like a post (create a like document)
  Future<Map<String, dynamic>> likePost(String userId, String postId) async {
    if (userId == 'anonymous') {
      throw Exception('Anonymous users cannot like posts');
    }

    final newLike = {
      'postId': postId,
      'userId': userId,
    };

    try {
      return await appwriteService.createDocument(
        collectionId: 'event_likes',
        data: {
          'documentId': 'unique()',
          'data': newLike,
        },
        documentId: 'unique()',
      );
    } catch (e) {
      throw Exception('Failed to like post: $e');
    }
  }

  // Get likes for a post
  Future<List<Map<String, dynamic>>> getPostLikes(String postId) async {
    try {
      final response = await appwriteService.listDocuments(
        collectionId: 'event_likes',
        queries: [
          Query.equal('postId', postId),
        ]
      );

      if (response.containsKey('documents') && response['documents'] is List) {
        final documents = response['documents'] as List;
        return documents.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to fetch likes: ${response.toString()}');
      }
    } catch (e) {
      throw Exception('Failed to fetch likes: ${e.toString()}');
    }
  }
}
