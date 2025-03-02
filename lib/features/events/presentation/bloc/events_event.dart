part of 'events_bloc.dart';

abstract class EventsEvent extends Equatable {
  const EventsEvent();

  @override
  List<Object> get props => [];
}


class ToggleFavoriteEvent extends EventsEvent {
  final int eventId;

  const ToggleFavoriteEvent(this.eventId);

  @override
  List<Object> get props => [eventId];

  @override
  String toString() => 'ToggleFavoriteEvent(eventId: $eventId)';
}

class LoadEventsEvent extends EventsEvent {
  @override
  String toString() => 'LoadEventsEvent';
}