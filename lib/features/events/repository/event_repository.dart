import '../data/models/event_model.dart';
import '../services/event_service.dart';

class EventRepository {
  final EventService _eventService;
  
  EventRepository({required EventService eventService}) 
      : _eventService = eventService;
  
  // Get all events
  Future<List<EventModel>> getEvents() async {
    return await _eventService.getEvents();
  }
  
  // Get user's favorites
  Future<Set<String>> getUserLiked(String userId) async {
    final favorites = await _eventService.getUserLikedEvents(userId);
    return favorites.toSet();
  }
  
  // Toggle favorite status
  Future<void> toggleFavorite(String userId, String eventId, bool isFavorite) async {
    if (isFavorite) {
      await _eventService.unlikeEvent(userId, eventId);
    } else {
      await _eventService.likeEvent(userId, eventId);
    }
  }
  
}