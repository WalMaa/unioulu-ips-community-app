import 'package:isar/isar.dart';
import 'dart:convert';

part 'event_model.g.dart';

@collection
class EventModel {
  Id isarId = Isar.autoIncrement;
  
  // Remote ID from Appwrite
  @Index(unique: true)
  late String remoteId;
  
  late String posterPhotoUrl;
  late String titleEn;
  late String titleFi;
  late String titleSv;
  late String locationEn;
  late String locationFi;
  late String locationSv;
  late String date;
  late String time;
  late String price;
  late String organizerName;
  late String detailsEn;
  late String detailsFi;
  late String detailsSv;
  late String ticketDetailsEn;
  late String ticketDetailsFi;
  late String ticketDetailsSv;
  late String locationUrl;
  late String topics;
  late DateTime createdAt;
  late DateTime updatedAt;

  // Default constructor
  EventModel();
  
  // Named constructor for creating from params
  EventModel.create({
    required String id,
    required String posterPhotoUrl,
    required String titleEn,
    required String titleFi,
    required String titleSv,
    required String locationEn,
    required String locationFi,
    required String locationSv,
    required String date,
    required String time,
    required String price,
    required String organizerName,
    required String detailsEn,
    required String detailsFi,
    required String detailsSv,
    required String ticketDetailsEn,
    required String ticketDetailsFi,
    required String ticketDetailsSv,
    required String locationUrl,
    required String topics,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) {
    this.remoteId = id;
    this.posterPhotoUrl = posterPhotoUrl;
    this.titleEn = titleEn;
    this.titleFi = titleFi;
    this.titleSv = titleSv;
    this.locationEn = locationEn;
    this.locationFi = locationFi;
    this.locationSv = locationSv;
    this.date = date;
    this.time = time;
    this.price = price;
    this.organizerName = organizerName;
    this.detailsEn = detailsEn;
    this.detailsFi = detailsFi;
    this.detailsSv = detailsSv;
    this.ticketDetailsEn = ticketDetailsEn;
    this.ticketDetailsFi = ticketDetailsFi;
    this.ticketDetailsSv = ticketDetailsSv;
    this.locationUrl = locationUrl;
    this.topics = topics;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }

  // Create from Appwrite document
  factory EventModel.fromMap(Map<String, dynamic> map) {
    final model = EventModel();
    model.remoteId = map['\$id'] ?? '';
    model.posterPhotoUrl = map['posterPhotoUrl'] ?? '';
    model.titleEn = map['title_en'] ?? '';
    model.titleFi = map['title_fi'] ?? '';
    model.titleSv = map['title_sv'] ?? '';
    model.locationEn = map['location_en'] ?? '';
    model.locationFi = map['location_fi'] ?? '';
    model.locationSv = map['location_sv'] ?? '';
    model.date = map['date'] ?? '';
    model.time = map['time'] ?? '';
    model.price = map['price'] ?? '';
    model.organizerName = map['organizerName'] ?? '';
    model.detailsEn = map['details_en'] ?? '';
    model.detailsFi = map['details_fi'] ?? '';
    model.detailsSv = map['details_sv'] ?? '';
    model.ticketDetailsEn = map['ticketDetails_en'] ?? '';
    model.ticketDetailsFi = map['ticketDetails_fi'] ?? '';
    model.ticketDetailsSv = map['ticketDetails_sv'] ?? '';
    model.locationUrl = map['locationUrl'] ?? '';
    model.topics = map['topics'] ?? '';
    model.createdAt = map['\$createdAt'] != null 
        ? DateTime.parse(map['\$createdAt']) 
        : DateTime.now();
    model.updatedAt = map['\$updatedAt'] != null 
        ? DateTime.parse(map['\$updatedAt']) 
        : DateTime.now();
    
    return model;
  }

  // Convert to map for creating/updating Appwrite documents
  Map<String, dynamic> toMap() {
    return {
      'posterPhotoUrl': posterPhotoUrl,
      'title_en': titleEn,
      'title_fi': titleFi,
      'title_sv': titleSv,
      'location_en': locationEn,
      'location_fi': locationFi,
      'location_sv': locationSv,
      'date': date,
      'time': time,
      'price': price,
      'organizerName': organizerName,
      'details_en': detailsEn,
      'details_fi': detailsFi,
      'details_sv': detailsSv,
      'ticketDetails_en': ticketDetailsEn,
      'ticketDetails_fi': ticketDetailsFi,
      'ticketDetails_sv': ticketDetailsSv,
      'locationUrl': locationUrl,
      'topics': topics,
    };
  }
  
  // Convert to JSON string
  String toJson() => json.encode(toMap());
  
  // Equality operators and hashCode for proper comparisons
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventModel &&
          runtimeType == other.runtimeType &&
          remoteId == other.remoteId;

  @override
  int get hashCode => remoteId.hashCode;
  
  // String representation for debugging
  @override
  String toString() => 'EventModel(remoteId: $remoteId, title: $titleEn)';
}