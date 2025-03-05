import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../core/services/http_appwrite_service.dart';
import '../../data/models/topic_model.dart';
import '../../../../core/utils/icon_map.dart';

class TopicListWidget extends StatelessWidget {
  final String currentLocale;
  final AppwriteService appwriteService;

  const TopicListWidget({
    super.key,
    required this.currentLocale,
    required this.appwriteService,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: FutureBuilder<Map<String, dynamic>>(
        future: appwriteService.listDocuments(
          collectionId: "topics"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty != 200) {
            return const Text('Failed to load topics');
          } else {
            final List<dynamic> jsonData =
                snapshot.data!['documents'];
            final topics =
                jsonData.map((json) => TopicModel.fromJson(json)).toList();

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                final topicText = _getLocalizedText(topic, currentLocale);

                return Container(
                  width: 90.0,
                  margin: const EdgeInsets.only(right: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          shape: BoxShape.circle,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(
                          iconMap[topic.icon] ?? Icons.help, // Use the icon map
                          color: Colors.blue,
                          size: 40.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        topicText,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  // Helper function to get localized text based on current locale
  String _getLocalizedText(TopicModel topic, String currentLocale) {
    switch (currentLocale) {
      case 'fi':
        return topic.textFi;
      case 'sv':
        return topic.textSv;
      default:
        return topic.textEn;
    }
  }
}
