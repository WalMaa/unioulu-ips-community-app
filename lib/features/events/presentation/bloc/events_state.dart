part of 'events_bloc.dart';

abstract class EventsState extends Equatable {
  const EventsState();

  @override
  List<Object> get props => [];
}

class EventsInitial extends EventsState {}

class EventsLoading extends EventsState {}

class EventsLoaded extends EventsState {
  final List<dynamic> events;
  final Set<int> favorites;

  const EventsLoaded({
    required this.events,
    required this.favorites,
  });

  @override
  List<Object> get props => [events, favorites];

  @override
  String toString() =>
      'EventsLoaded(events: ${events.length}, favorites: $favorites)';

  // Copy method to easily create new versions of EventsLoaded
  EventsLoaded copyWith({
    List<dynamic>? events,
    Set<int>? favorites,
  }) {
    return EventsLoaded(
      events: events ?? this.events,
      favorites: favorites ?? this.favorites,
    );
  }
}


class EventsError extends EventsState {
  final String message;

  const EventsError({required this.message});

  @override
  List<Object> get props => [message];
  
  @override
  String toString() => 'EventsError(message: $message)';
}