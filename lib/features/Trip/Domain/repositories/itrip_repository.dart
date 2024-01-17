import 'package:hotel_ui/features/Trip/Domain/entities/trip.dart';

abstract class ITripRepository {
  Future<List<Trip>> getTrip();
  Future<void> addTrip(Trip trip);
  Future<void> deleteTrip(int index);
}
