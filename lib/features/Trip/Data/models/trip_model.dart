import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';

import '../../Domain/entities/trip.dart';

part 'trip_model.g.dart';

@HiveType(typeId: 0)
class TripModel {
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final List<String>? pictures;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final DateTime? date;
  @HiveField(4)
  final String? location;

  TripModel(
      {required this.title,
      required this.pictures,
      required this.description,
      required this.date,
      required this.location});

  // conversion from Entity to model
  factory TripModel.fromEntity(Trip trip) => TripModel(
      title: trip.title,
      pictures: trip.pictures,
      description: trip.description,
      date: trip.date,
      location: trip.location);

  // conversion from model to entity
  Trip toEntity() => Trip(
      title: title,
      pictures: pictures,
      description: description,
      date: date,
      location: location);
}
