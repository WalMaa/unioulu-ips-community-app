import 'dart:io';

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
    print('URL: $url');
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

  // Method to upload a file
  Future<http.Response> uploadFile(
      String endpointPath, File file, String fileId) async {
    final url = Uri.parse('$endpoint/$endpointPath');

    final request = http.MultipartRequest('POST', url)
      ..headers.addAll({
        'X-Appwrite-Project': projectId,
        'X-Appwrite-Key': apiKey,
        'X-Appwrite-Response-Format': '1.5.0',
      })
      ..fields['fileId'] =
          fileId // Optional: Use `ID.unique()` to auto-generate a unique ID in Appwrite
      ..files.add(await http.MultipartFile.fromPath('file', file.path));

    final response = await request.send();
    return await http.Response.fromStream(response);
  }
}
