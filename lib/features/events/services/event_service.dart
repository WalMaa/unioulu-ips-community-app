import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:community/core/utils/config.dart';
import '../models/event_model.dart';

class EventService {
  final Databases _databases;
  
  EventService({required Databases databases}) : _databases = databases;
  
  // Fetch all events
  Future<List<EventModel>> getEvents() async {
    try {
      final response = await _databases.listDocuments(
        databaseId: appwriteDatabaseId,
        collectionId: "events",
      );
      
      return response.documents.map((doc) => EventModel.fromMap(doc.data)).toList();
    } catch (e) {
      throw Exception('Failed to fetch events: ${e.toString()}');
    }
  }
  
  // Like an event (create a like document)
  Future<Document> likeEvent(String userId, String eventId) async {
    try {
      return await _databases.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.likesCollectionId,
        documentId: ID.unique(),
        data: {
          'user_id': userId,
          'event_id': eventId,
          'created_at': DateTime.now().toIso8601String(),
        },
      );
    } catch (e) {
      throw Exception('Failed to like event: ${e.toString()}');
    }
  }
  
  // Unlike an event (delete the like document)
  Future<void> unlikeEvent(String userId, String eventId) async {
    try {
      // First find the like document
      final likes = await _databases.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.likesCollectionId,
        queries: [
          Query.equal('user_id', userId),
          Query.equal('event_id', eventId),
        ],
      );
      
      if (likes.documents.isNotEmpty) {
        // Delete the like document
        await _databases.deleteDocument(
          databaseId: AppwriteConstants.databaseId,
          collectionId: AppwriteConstants.likesCollectionId,
          documentId: likes.documents.first.$id,
        );
      }
    } catch (e) {
      throw Exception('Failed to unlike event: ${e.toString()}');
    }
  }
  
  // Get user's liked events
  Future<List<String>> getUserLikedEvents(String userId) async {
    try {
      final response = await _databases.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.likesCollectionId,
        queries: [
          Query.equal('user_id', userId),
        ],
      );
      
      return response.documents
          .map((doc) => doc.data['event_id'] as String)
          .toList();
    } catch (e) {
      throw Exception('Failed to get liked events: ${e.toString()}');
    }
  }
}