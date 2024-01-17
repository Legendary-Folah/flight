import 'package:hotel_ui/features/Trip/Data/datasource/trip_local_datasource.dart';
import 'package:hotel_ui/features/Trip/Data/models/trip_model.dart';
import 'package:hotel_ui/features/Trip/Domain/entities/trip.dart';
import 'package:hotel_ui/features/Trip/Domain/repositories/itrip_repository.dart';

class TripRepository implements ITripRepository {
  TripRepository(this._localDataSource);
  final TripLocalDataSource _localDataSource;

  @override
  Future<void> addTrip(Trip trip) async {
    final tripModel = TripModel.fromEntity(trip);
    _localDataSource.addTrips(tripModel);
  }

  @override
  Future<void> deleteTrip(int index) async {
    _localDataSource.deleteTrips(index);
  }

  @override
  Future<List<Trip>> getTrip() async {
    final tripModel = _localDataSource.getTrips();
    List<Trip> result = tripModel.map((model) => model.toEntity()).toList();
    return result;
  }
}
