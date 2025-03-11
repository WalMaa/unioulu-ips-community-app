import 'dart:convert';
import 'dart:developer' as developer;

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:community/core/services/http_appwrite_service.dart';
import 'package:community/core/utils/config.dart';
import 'package:community/features/events/data/models/event_like_model.dart';

import '../data/models/event_model.dart';

class EventService {
  final Databases _databases;
  final AppwriteService appwriteService = AppwriteService();

  EventService({required Databases databases}) : _databases = databases;

  // Fetch all events
  Future<List<EventModel>> getEvents() async {
    try {
      final response = await appwriteService.listDocuments(
        collectionId: "events",
      );

      // Parse the response
      if (response.containsKey('documents') && response['documents'] is List) {
        final documents = response['documents'] as List;
        developer.log('Successfully fetched ${documents.length} events');

        return documents
            .map((doc) {
              try {
                if (doc is Map<String, dynamic>) {
                  return EventModel.fromMap(doc['data'] ?? doc);
                }
                return EventModel.fromMap(jsonDecode(jsonEncode(doc))['data'] ??
                    jsonDecode(jsonEncode(doc)));
              } catch (e) {
                developer.log('Error parsing event document: $e');
                return null;
              }
            })
            .whereType<EventModel>()
            .toList();
      } else {
        throw Exception('Failed to fetch events: ${response.toString()}');
      }
    } catch (e) {
      throw Exception('Failed to fetch events: ${e.toString()}');
    }
  }

  // Like an event (create a like document)
  Future<Map<String, dynamic>> likeEvent(String userId, String eventId) async {
    if (userId == 'anonymous') {
      throw Exception('Anonymous users cannot like events');
    }

    final newLike = EventLikeModel(eventId: eventId, userId: userId);

    try {
      developer.log('Creating like document for user $userId, event $eventId');
      return await appwriteService.createDocument(
        collectionId: "event_likes",
        data: {
          'documentId': 'unique()',
          'data': newLike.toJson(),
        },
        documentId: 'unique()',
      );
    } catch (e) {
      developer.log('Failed to like event: ${e.toString()}');
      throw Exception('Failed to like event: ${e.toString()}');
    }
  }

  // Unlike an event (delete the like document)
  Future<void> unlikeEvent(String userId, String eventId) async {
    if (userId == 'anonymous') {
      throw Exception('Anonymous users cannot unlike events');
    }

    try {
      // First find the like document
      developer.log('Finding like document for user $userId, event $eventId');
      final response = await appwriteService.listDocuments(
        collectionId: "event_likes",
        queries: [
          Query.equal('userId', userId),
          Query.equal('eventId', eventId),
      ],
      );

      // Check if document exists and delete it
      if (response.containsKey('documents') &&
          response['documents'] is List &&
          (response['documents'] as List).isNotEmpty) {
        final documentId = response['documents'][0]['\$id'];
        developer.log('Found like document with ID: $documentId, deleting...');

        // Delete the document
        await appwriteService.makeRequest(
          method: 'DELETE',
          endpointPath:
              'databases/${appwriteService.databaseId}/collections/event_likes/documents/$documentId',
        );

        developer.log('Successfully deleted like document');
      } else {
        developer.log('No like document found to delete');
      }
    } catch (e) {
      developer.log('Failed to unlike event: ${e.toString()}');
      throw Exception('Failed to unlike event: ${e.toString()}');
    }
  }

  // Get user's liked events
  Future<List<String>> getUserLikedEvents(String userId) async {
    if (userId == 'anonymous') {
      developer.log('Anonymous user has no likes');
      return []; // Anonymous users have no likes
    }

    try {
      developer.log('Fetching liked events for user $userId');
      final response = await appwriteService.listDocuments(
        collectionId: "event_likes",
        queries: [
          "equal('user_id', '$userId')",
        ],
      );

      if (response.containsKey('documents') && response['documents'] is List) {
        final likes = (response['documents'] as List)
            .map((doc) {
              if (doc is Map && doc.containsKey('data')) {
                final data = doc['data'];
                if (data is Map && data.containsKey('event_id')) {
                  return data['event_id'] as String;
                }
              }
              return null;
            })
            .whereType<String>()
            .toList();

        developer.log('Found ${likes.length} liked events');
        return likes;
      }

      developer.log('No liked events found or invalid response format');
      return [];
    } catch (e) {
      developer.log('Failed to get liked events: ${e.toString()}');
      return []; // Return empty list on error instead of throwing
    }
  }
}
