import 'package:flutter/material.dart';
import '../../data/models/event_model.dart';

class EventDetailsPage extends StatelessWidget {
  final EventModel event;

  const EventDetailsPage({super.key, required this.event});

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
        body: TabBarView(
          children: [
            // Info Tab
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(event.posterPhotoUrl,
                      width: 450, height: 200, fit: BoxFit.fitWidth),
                  const SizedBox(height: 16.0),
                  Text(
                    event.titleEn, // Localized title based on the language
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
                  Image.network(event.posterPhotoUrl,
                      width: 450, height: 200, fit: BoxFit.fitWidth),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Ticket Information',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(event.ticketDetailsEn), // Localized ticket details
                ],
              ),
            ),
            // Location Tab
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(event.posterPhotoUrl,
                      width: 450, height: 200, fit: BoxFit.fitWidth),
                  const SizedBox(height: 16.0),
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
                  const SizedBox(height: 16.0),
                  // Displaying map or link
                  // InkWell(
                  //   onTap: () {
                  //     // Open the location URL in the map
                  //   },
                  //   child: Image.network(
                  //     'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4758.6504959061!2d25.467976619008706!3d65.05913641824176!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46802d0fee05afb3%3A0xe8963f6b08a1eba1!2sUniversity%20of%20Oulu!5e0!3m2!1sen!2sfi!4v1725497760094!5m2!1sen!2sfi', // Update with actual Google Maps API key
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
