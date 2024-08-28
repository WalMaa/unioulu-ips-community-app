import 'package:http/http.dart' as http;
import 'dart:convert';

import '../utils/config.dart';

class AppwriteService {
  final String endpoint = appwriteEndpoint;
  final String projectId = appwriteProjectId;
  final String apiKey = appwriteApiKey;

  AppwriteService();

  Future<http.Response> makeRequest(
      String method, String endpointPath, Map<String, dynamic>? data) async {
    final url = Uri.parse('$endpoint/$endpointPath');

    final headers = {
      'Content-Type': 'application/json',
      'X-Appwrite-Project': projectId,
      'X-Appwrite-Key': apiKey,
      'X-Appwrite-Response-Format': '1.5.0',
    };

    http.Response response;

    // Switch to handle different HTTP methods
    switch (method.toUpperCase()) {
      case 'POST':
        response =
            await http.post(url, headers: headers, body: jsonEncode(data));
        break;
      case 'PUT':
        response =
            await http.put(url, headers: headers, body: jsonEncode(data));
        break;
      case 'DELETE':
        response =
            await http.delete(url, headers: headers, body: jsonEncode(data));
        break;
      case 'PATCH':
        response =
            await http.patch(url, headers: headers, body: jsonEncode(data));
        break;
      case 'GET':
        response = await http.get(url, headers: headers);
        break;
      default:
        throw Exception('Invalid HTTP method: $method');
    }

    return response;
  }
}
