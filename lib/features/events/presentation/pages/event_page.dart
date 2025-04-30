
import 'package:community/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/services/http_appwrite_service.dart';
import '../../../home/presentation/widgets/topic_list_widget.dart';
import '../../../language/presentation/bloc/language_bloc.dart';
import '../../data/models/event_model.dart';
import '../widgets/event_card.dart';
import 'event_detail_page.dart';

class EventsPage extends StatelessWidget {
  final String? selectedTopicId;

  const EventsPage({
    super.key,
    this.selectedTopicId,
  });

  @override
  Widget build(BuildContext context) {
    final currentLocale = context
        .select((LocalizationBloc bloc) => bloc.state.locale.languageCode);

    final appwriteService = GetIt.instance<AppwriteService>();

    return Scaffold(
      appBar: CustomAppBar(title: "Events",),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              TopicListWidget(
                currentLocale: currentLocale,
                appwriteService: appwriteService,
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Events for Selected Topic',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: FutureBuilder<Map<String, dynamic>>(
                  future: appwriteService.listDocuments(
                    collectionId: 'events',
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      return const Text('Failed to load events');
                    } else {
                      // Get documents directly from the response map
                      // instead of decoding the body
                      final List<dynamic> jsonData =
                          snapshot.data!['documents'];

                      final filteredEvents = selectedTopicId != null
                          ? jsonData
                              .where((event) =>
                                  event['topics'].contains(selectedTopicId))
                              .toList()
                          : jsonData; // Show all events if no topic is selected

                      // Sort the filteredEvents list
                      filteredEvents.sort((a, b) {
                        final DateTime aDate = DateTime.parse(a['\$updatedAt']);
                        final DateTime bDate = DateTime.parse(b['\$updatedAt']);
                        return bDate.compareTo(aDate); // Descending order
                      });

                      if (filteredEvents.isEmpty) {
                        return const Center(
                          child: Text('No events found for the selected topic'),
                        );
                      }

                      return ListView.builder(
                        itemCount: filteredEvents.length,
                        itemBuilder: (context, index) {
                          final event =
                              EventModel.fromMap(filteredEvents[index]);
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EventDetailsPage(event: event),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: EventCard(event: event),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


