import 'package:flutter_dotenv/flutter_dotenv.dart';
String appwriteEndpoint = dotenv.env['APPWRITE_URL']!;
String appwriteProjectId = dotenv.env['APPWRITE_PROJECT_ID']!;
String appwriteApiKey = dotenv.env['APPWRITE_API_KEY']!;
String appwriteDatabaseId = dotenv.env['APPWRITE_DATABASE_ID']!;
String appwriteBucketId = dotenv.env['APPWRITE_BUCKET_ID']!;
  