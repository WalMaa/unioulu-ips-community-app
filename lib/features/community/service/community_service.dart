
import 'package:appwrite/appwrite.dart';
import 'package:community/core/services/http_appwrite_service.dart';
import 'package:community/features/community/data/models/post_model.dart';

class CommunityService {
    final AppwriteService _appwriteService;
  
  CommunityService({required AppwriteService appwriteService}) 
      : _appwriteService = appwriteService;

  Future<List<PostModel>> getPosts() async {
  try {
    final response = await _appwriteService.listDocuments(
      collectionId: "posts",
    );

    if (response.containsKey('documents') && response['documents'] is List) {
      final documents = response['documents'] as List;
      
      // Properly convert to PostModel objects
      return documents.map((doc) {
        try {
          if (doc is Map<String, dynamic>) {
            return PostModel.fromMap(doc['data'] ?? doc);
          }
          return null;
        } catch (e) {
          print('Error parsing post document: $e');
          return null;
        }
      })
      .whereType<PostModel>()  // Filter out nulls
      .toList();
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
      return await _appwriteService.createDocument(
        collectionId: 'post_likes',
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
      final response = await _appwriteService.listDocuments(
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
