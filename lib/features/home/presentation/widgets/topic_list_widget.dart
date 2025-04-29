import 'package:community/core/theme/theme_constants.dart';
import 'package:flutter/material.dart';
import '../../../../core/services/http_appwrite_service.dart';
import '../../data/models/topic_model.dart';
import '../../../../core/utils/icon_map.dart';

class TopicListWidget extends StatelessWidget {
  final String currentLocale;
  final AppwriteService appwriteService;
  final Function(TopicModel)? onTopicSelected;
  final TopicModel? selectedTopic;

  const TopicListWidget({
    super.key,
    required this.currentLocale,
    required this.appwriteService,
    this.onTopicSelected,
    this.selectedTopic,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.smallPadding),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Topics',
              textAlign: TextAlign.start,
              style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 150.0,
            child: FutureBuilder<Map<String, dynamic>>(
              future: appwriteService.listDocuments(collectionId: "topics"),
              builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
            const Icon(Icons.error_outline,
                color: Colors.red, size: 30),
            const SizedBox(height: 8),
            Text('Error loading topics: ${snapshot.error}'),
                ],
              ),
            );
          } else if (!snapshot.hasData ||
              snapshot.data!['documents'] == null) {
            return const Center(child: Text('Failed to load topics'));
          } else {
            final List<dynamic> jsonData = snapshot.data!['documents'];

            if (jsonData.isEmpty) {
              return const Center(child: Text('No topics available'));
            }

            final topics = jsonData
                .map((json) => TopicModel.fromJson(json))
                .toList();

            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final topic = topics[index];
                final topicText = _getLocalizedText(topic, currentLocale);
                final isSelected = selectedTopic?.id == topic.id;

                return GestureDetector(
            onTap: () => onTopicSelected?.call(topic),
            child: Container(
              width: 90.0,
              margin: const EdgeInsets.only(right: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isSelected
                    ? Theme.of(context)
                  .colorScheme
                  .primary
                  .withAlpha(50)
                    : Theme.of(context)
                  .scaffoldBackgroundColor,
                shape: BoxShape.circle,
                border: isSelected
                    ? Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .primary,
                  width: 2)
                    : null,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Icon(
                iconMap[topic.icon] ?? Icons.help,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.blue,
                size: 40.0,
              ),
                  ),
                  const SizedBox(height: 8.0),
                  Align(
              alignment: Alignment.centerLeft,
              child: Text(
                topicText,
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.blue,
                  fontWeight: isSelected
                ? FontWeight.bold
                : FontWeight.w500,
                ),
              ),
                  ),
                ],
              ),
            ),
                );
              },
            );
          }
              },
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to get localized text based on current locale
  String _getLocalizedText(TopicModel topic, String currentLocale) {
    switch (currentLocale) {
      case 'fi':
        return topic.textFi.isNotEmpty ? topic.textFi : topic.textEn;
      case 'sv':
        return topic.textSv.isNotEmpty ? topic.textSv : topic.textEn;
      default:
        return topic.textEn;
    }
  }
}
