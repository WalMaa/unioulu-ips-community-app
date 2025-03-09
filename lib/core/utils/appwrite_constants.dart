import './config.dart';

class AppwriteConstants {
  static const String endpoint = appwriteEndpoint;
  static const String projectId = appwriteProjectId;
  static const String databaseId = appwriteDatabaseId;
  static const String eventsCollectionId = 'events';
  static const String likesCollectionId = 'event_likes';
  static const String usersCollectionId = 'users';
  
  // Add API key only if it's needed for server-side functions
  static const String apiKey = appwriteApiKey;
}