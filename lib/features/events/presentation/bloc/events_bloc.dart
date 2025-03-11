import 'dart:developer' as developer;

import 'package:community/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../repository/event_repository.dart';
import 'events_state.dart';
part 'events_event.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final EventRepository _eventRepository;
  final AuthRepositoryImpl _authRepository;

  EventsBloc({
    required EventRepository eventRepository, 
    required AuthRepositoryImpl authRepository,
  }) : _eventRepository = eventRepository,
       _authRepository = authRepository,
       super(EventsInitial()) {
    on<FetchEvents>(_onFetchEvents);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onFetchEvents(
      FetchEvents event, Emitter<EventsState> emit) async {
    emit(EventsLoading());

    try {
      developer.log('Fetching events for user: $event');
      // Get events from repository
      final events = await _eventRepository.getEvents();
      // Get user favorites
      final favorites = await _eventRepository.getUserLiked(event.userId);

      emit(EventsLoaded(events: events, favorites: favorites));
    } catch (e) {
      developer.log('Failed to fetch events: ${e.toString()}');
      emit(EventsError(message: e.toString()));
    }
  }

  Future<void> _onToggleFavorite(
      ToggleFavorite event, Emitter<EventsState> emit) async {
        developer.log('Toggling favorite for event: ${event.eventId}');
        developer.log('Current state: ${state.runtimeType}');
    if (state is EventsLoaded) {
      final currentState = state as EventsLoaded;
      try {
        // Get current user ID from auth repository
        final userId = await _authRepository.getCurrentUserId();
        final isFavorite = currentState.favorites.contains(event.eventId);

        // Optimistic update
        final updatedFavorites = Set<String>.from(currentState.favorites);
        if (isFavorite) {
          updatedFavorites.remove(event.eventId);
        } else {
          updatedFavorites.add(event.eventId);
        }

        emit(currentState.copyWith(favorites: updatedFavorites));

        // Call repository
        await _eventRepository.toggleFavorite(
          userId,
          event.eventId,
          isFavorite,
        );
      } catch (e) {
        // Revert on error
        developer.log('Failed to toggle favorite: ${e.toString()}');
        emit(currentState);
        emit(EventsError(message: e.toString()));
      }
    }
  }
}

class FetchEvents extends EventsEvent {
  final String userId;

  const FetchEvents({required this.userId});

  @override
  List<Object> get props => [userId];
}

class ToggleFavorite extends EventsEvent {
  final String eventId;

  const ToggleFavorite({required this.eventId});

  @override
  List<Object> get props => [eventId];
}
