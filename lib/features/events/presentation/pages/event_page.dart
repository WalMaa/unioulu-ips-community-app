
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/services/http_appwrite_service.dart';
import '../../../home/presentation/widgets/topic_list_widget.dart';
import '../../../language/presentation/bloc/language_bloc.dart';
import '../../data/models/event_model.dart';
import 'event_detail_page.dart';

class EventsPage extends StatelessWidget {
  final String? selectedTopicId; // Make it nullable

  const EventsPage({
    super.key,
    this.selectedTopicId, // Make it optional
  });

  @override
  Widget build(BuildContext context) {
    final currentLocale = context
        .select((LocalizationBloc bloc) => bloc.state.locale.languageCode);

    final appwriteService = GetIt.instance<AppwriteService>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Topics',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
                              // Navigate to Event Details Page with event details
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

class EventCard extends StatelessWidget {
  final EventModel event;
  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0), // Padding inside the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event Image
            Container(
              height: 200.0, // Adjust the height as needed
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Display event image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      event.posterPhotoUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover, // Adjust the image fit
                    ),
                  ),
                  // Favorite button in top-right corner
                  Positioned(
                    top: 8.0,
                    right: 8.0,
                    child: GestureDetector(
                      onTap: () {
                        // Handle favorite toggle logic here
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Icon(
                          Icons.bookmark_border_rounded,
                          color: Colors.white,
                          size: 24.0,
                        ),
                      ),
                    ),
                  ),
                  // Price tag in bottom-left corner
                  Positioned(
                    bottom: 8.0,
                    left: 8.0,
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        event.price,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            // Event Title
            Text(
              event.titleEn, // Replace with localized text if necessary
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5.0),
            // Event Location
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 16.0,
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  child: Text(
                    event.locationEn, // Localized location text
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5.0),
            // Event Date and Time
            Row(
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                  size: 16.0,
                ),
                const SizedBox(width: 4.0),
                Text(
                  event.date,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(width: 8.0),
                const Text('|'),
                const SizedBox(width: 8.0),
                Text(
                  event.time,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
