import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String? imageUrl;
  final DateTime date;
  final String location;
  final String organizerId;
  final int capacity;
  final int? attendeeCount;
  final List<String>? tags;
  final bool isPublic;
  final DateTime createdAt;
  final DateTime updatedAt;

  const EventModel({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.date,
    required this.location,
    required this.organizerId,
    required this.capacity,
    this.attendeeCount,
    this.tags,
    required this.isPublic,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
        date,
        location,
        organizerId,
        capacity,
        attendeeCount,
        tags,
        isPublic,
        createdAt,
        updatedAt,
      ];

  // Factory constructor to create an EventModel from a Map (Appwrite document)
  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['\$id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['image_url'],
      date: DateTime.tryParse(map['date'] ?? '') ?? DateTime.now(),
      location: map['location'] ?? '',
      organizerId: map['organizer_id'] ?? '',
      capacity: map['capacity'] ?? 0,
      attendeeCount: map['attendee_count'],
      tags: map['tags'] != null 
          ? List<String>.from(map['tags']) 
          : null,
      isPublic: map['is_public'] ?? true,
      createdAt: DateTime.tryParse(map['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(map['updated_at'] ?? '') ?? DateTime.now(),
    );
  }

  // Convert the model to a Map (useful for creating/updating documents)
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'date': date.toIso8601String(),
      'location': location,
      'organizer_id': organizerId,
      'capacity': capacity,
      'attendee_count': attendeeCount,
      'tags': tags,
      'is_public': isPublic,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  // Create a copy with some fields updated
  EventModel copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    DateTime? date,
    String? location,
    String? organizerId,
    int? capacity,
    int? attendeeCount,
    List<String>? tags,
    bool? isPublic,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      date: date ?? this.date,
      location: location ?? this.location,
      organizerId: organizerId ?? this.organizerId,
      capacity: capacity ?? this.capacity,
      attendeeCount: attendeeCount ?? this.attendeeCount,
      tags: tags ?? this.tags,
      isPublic: isPublic ?? this.isPublic,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}