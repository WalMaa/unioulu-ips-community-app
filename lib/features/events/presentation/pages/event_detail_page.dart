import 'dart:developer' as developer;

import 'package:community/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:community/features/events/presentation/bloc/events_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/event_model.dart';
import '../bloc/events_state.dart';
import 'package:community/main.dart' show locator;  // Import locator directly

Future<void> _loadEvents(BuildContext context) async {
  try {
    final authRepository = locator<AuthRepositoryImpl>();
    final eventsBloc = context.read<EventsBloc>();
    String? userId;
    
    try {
      userId = await authRepository.getCurrentUserId();
      developer.log('Loading events from EventLayout with userId: $userId');
    } catch (e) {
      developer.log('Error getting user ID: ${e.toString()}');
      userId = 'anonymous';  // Fallback to anonymous if we can't get userId
    }
    
    // Add null safety here
    eventsBloc.add(FetchEvents(userId: userId));
  } catch (e) {
    developer.log('Critical error loading events from EventLayout: ${e.toString()}');
    // Always try to load anonymous events as a last resort
    context.read<EventsBloc>().add(const FetchEvents(userId: 'anonymous'));
  }
}

class EventDetailsPage extends StatelessWidget {
  final EventModel event;
  const EventDetailsPage({super.key, required this.event});

  @override
  Widget build(BuildContext context) {

    return BlocListener<EventsBloc, EventsState>(
      listener: (context, state) {
        if (state is EventsInitial) {
          _loadEvents(context);
        } else if (state is EventsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.message}')),
          );
        }
      },
      child: DefaultTabController(
        length: 3, // Info, Ticket, Location
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.chevron_left,
                color: Theme.of(context).scaffoldBackgroundColor,
                size: 30,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            title: Text(
              'Event Details',
              style:
                  TextStyle(color: Theme.of(context).scaffoldBackgroundColor),
            ),
            iconTheme: IconThemeData(
              color: Theme.of(context)
                  .scaffoldBackgroundColor, // Change back arrow color
            ),
            bottom: TabBar(
              // Add indicator for the active tab
              indicator: BoxDecoration(
                color: Theme.of(context)
                    .scaffoldBackgroundColor, // Active tab background color
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              // Style for unselected tabs
              unselectedLabelColor: Colors.white70, // Inactive tab text color
              labelColor:
                  Theme.of(context).primaryColor, // Active tab text color

              // Remove the default indicator
              indicatorSize: TabBarIndicatorSize.tab,

              // Tab background color (for all tabs)
              labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              tabs: const [
                Tab(text: 'Info'),
                Tab(text: 'Ticket'),
                Tab(text: 'Location'),
              ],
            ),
          ),
          body: Column(
            children: [
              // The static event image placed outside the TabBarView
              EventLayout(event: event),
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
      ),
    );
  }
}

class EventLayout extends StatelessWidget {
  final EventModel event;
  const EventLayout({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventsBloc, EventsState>(
      listener: (context, state) {
        if (state is EventsInitial) {
          developer.log('EventLayout detected EventsInitial, loading events');
          _loadEvents(context);
        }
      },
      builder: (context, state) {
        developer.log('Building EventLayout with state: ${state.runtimeType}');
        
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  event.posterPhotoUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildFavoriteButton(context, state),
                    const SizedBox(width: 16.0),
                    TextButton.icon(
                      onPressed: () {},
                      label: const Text('Share'),
                      icon: const Icon(Icons.share),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  
  Widget _buildFavoriteButton(BuildContext context, EventsState state) {
    // Show loading indicator if we're loading events
    if (state is EventsLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          height: 24,
          width: 24,
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    // Check if the event is favorited
    final bool isFavorite = state is EventsLoaded && 
        state.favorites.contains(event.remoteId);
        
    return TextButton.icon(
      onPressed: () {
        // Check if state is loaded before toggling
        if (state is! EventsLoaded) {
          developer.log('State is not EventsLoaded, loading events first');
          _loadEvents(context);
          // To prevent immediate favorite toggle, we could return here
          // But let's continue - the EventsBloc handler should handle this case
        }
        
        developer.log('Attempting to toggle favorite for event: ${event.remoteId}');
        context.read<EventsBloc>().add(
          ToggleFavorite(eventId: event.remoteId),
        );
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
      ),
      label: const Text('Favorite'),
    );
  }
  

}