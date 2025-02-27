import 'package:flutter/material.dart';
import '../../data/models/event_model.dart';

class EventDetailsPage extends StatelessWidget {
  final EventModel event;

  const EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Info, Ticket, Location
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Event Details'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Info'),
              Tab(text: 'Ticket'),
              Tab(text: 'Location'),
            ],
          ),
        ),
        body: Column(
          children: [
            // The static event image placed outside the TabBarView
            EventLayout(url: event.posterPhotoUrl),
            // Tab content occupies the rest of the space
            Expanded(
              child: TabBarView(
                children: [
                  // Info Tab
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          event.titleEn,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 16),
                            const SizedBox(width: 4.0),
                            Text(event.locationEn),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 16),
                            const SizedBox(width: 4.0),
                            Text('${event.date} | ${event.time}'),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(Icons.money, size: 16),
                            const SizedBox(width: 4.0),
                            Text(event.price),
                          ],
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(Icons.person, size: 16),
                            const SizedBox(width: 4.0),
                            Text(event.organizerName),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Details',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(event.detailsEn),

                      ],
                    ),
                  ),
                  // Ticket Tab
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ticket Information',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(event.ticketDetailsEn),
                      ],
                    ),
                  ),
                  // Location Tab
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            const SizedBox(width: 8.0),
                            Expanded(child: Text(event.locationEn)),
                          ],
                        ),
                        // Additional location content can be added here.
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventLayout extends StatelessWidget {
  final String url;
  const EventLayout({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              url,
              width: double.infinity, // Full width image
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border),
                SizedBox(width: 4.0),
                Text('Favorite'),
                SizedBox(width: 16.0),
                Icon(Icons.share),
                SizedBox(width: 4.0),
                Text('Share'),
              ],
            ),
          ),
        ],
      ),
      
    );
  }
}
