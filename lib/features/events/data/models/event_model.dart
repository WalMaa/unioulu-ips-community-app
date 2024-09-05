import 'package:isar/isar.dart';

part 'event_model.g.dart';

@Collection()
class EventModel {
  Id id = Isar.autoIncrement;
  late String posterPhotoUrl; // URL of the poster image
  late String titleEn; // Title of the event in English
  late String titleFi; // Title of the event in Finnish
  late String titleSv; // Title of the event in Swedish
  late String locationEn; // Location of the event in English
  late String locationFi; // Location of the event in Finnish
  late String locationSv; // Location of the event in Swedish
  late String date; // Date of the event
  late String time; // Time of the event
  late String price; // Free or specific amount
  late String organizerName; // Name of the organizer
  late String detailsEn; // Event details in English
  late String detailsFi; // Event details in Finnish
  late String detailsSv; // Event details in Swedish
  late String ticketDetailsEn; // Ticket details in English
  late String ticketDetailsFi; // Ticket details in Finnish
  late String ticketDetailsSv; // Ticket details in Swedish
  late String locationUrl; // URL for map location
  late String topics; // Topics of the event
  late String updatedAt; // Updated at date

  EventModel({
    required this.posterPhotoUrl,
    required this.titleEn,
    required this.titleFi,
    required this.titleSv,
    required this.locationEn,
    required this.locationFi,
    required this.locationSv,
    required this.date,
    required this.time,
    required this.price,
    required this.organizerName,
    required this.detailsEn,
    required this.detailsFi,
    required this.detailsSv,
    required this.ticketDetailsEn,
    required this.ticketDetailsFi,
    required this.ticketDetailsSv,
    required this.locationUrl,
    required this.topics,
    required this.updatedAt,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      posterPhotoUrl: json['posterPhotoUrl'] ?? '',
      titleEn: json['title_en'] ?? '',
      titleFi: json['title_fi'] ?? '',
      titleSv: json['title_sv'] ?? '',
      locationEn: json['location_en'] ?? '',
      locationFi: json['location_fi'] ?? '',
      locationSv: json['location_sv'] ?? '',
      date: json['date'] ?? '',
      time: json['time'] ?? '',
      price: json['price'] ?? '',
      organizerName: json['organizerName'] ?? '',
      detailsEn: json['details_en'] ?? '',
      detailsFi: json['details_fi'] ?? '',
      detailsSv: json['details_sv'] ?? '',
      ticketDetailsEn: json['ticketDetails_en'] ?? '',
      ticketDetailsFi: json['ticketDetails_fi'] ?? '',
      ticketDetailsSv: json['ticketDetails_sv'] ?? '',
      locationUrl: json['locationUrl'] ?? '',
      topics: json['topics'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
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
      'updatedAt': updatedAt,
    };
  }
}
