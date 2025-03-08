import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc() : super(const EventsLoaded(events: [], favorites: {})) {
    on<EventsEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ToggleFavoriteEvent>(_onToggleFavorite);
    on<LoadEventsEvent>(_onLoadEvents);
  }

  void _onToggleFavorite(ToggleFavoriteEvent event, Emitter<EventsState> emit) {
    log('Processing ${event.toString()}');
    final currentState = state;

    if (currentState is EventsLoaded) {
      final currentFavorites = currentState.favorites;
      log('Current state: $currentFavorites');

      final isFavorited = currentFavorites.contains(event.eventId);
      // Create a new set (because state must be immutable)
      final updatedFavorites = Set<int>.from(currentFavorites);

      if (isFavorited) {
        updatedFavorites.remove(event.eventId);
      } else {
        updatedFavorites.add(event.eventId);
      }

      // Emit a new state with updated favorites
      emit(
        currentState.copyWith(favorites: updatedFavorites),
      );
    }
  } 

  void _onLoadEvents(LoadEventsEvent event, Emitter<EventsState> emit) async {
    log('Loading events...');
    emit(EventsLoading());
    
    try {
      // Here you would fetch events from your repository
      // For now we'll just emit an empty list
      final events = []; // Replace with actual event fetching
      final currentFavorites = state is EventsLoaded 
          ? (state as EventsLoaded).favorites 
          : <int>{};
          
      emit(EventsLoaded(events: events, favorites: currentFavorites));
      log('Events loaded successfully');
    } catch (e) {
      log('Error loading events: $e');
      emit(EventsError(message: 'Failed to load events: $e'));
    }
  }
}
