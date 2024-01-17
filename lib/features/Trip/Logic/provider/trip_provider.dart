import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hotel_ui/features/Trip/Data/datasource/trip_local_datasource.dart';
import 'package:hotel_ui/features/Trip/Data/repositories/trip_repository.dart';
import 'package:hotel_ui/features/Trip/Domain/entities/trip.dart';
import 'package:hotel_ui/features/Trip/Domain/usecases/add_trip.dart';
import 'package:hotel_ui/features/Trip/Domain/usecases/delete_trip.dart';
import 'package:hotel_ui/features/Trip/Domain/usecases/get_trip.dart';

import '../../Data/models/trip_model.dart';

final tripLocalDataSourceProvider = Provider<TripLocalDataSource>((ref){
  final Box<TripModel> tripBox = Hive.box('trips');
  return TripLocalDataSource(tripBox);
});

final tripRepositoryProvider = Provider<TripRepository>((ref){
  final localDataSource = ref.read(tripLocalDataSourceProvider);
  return TripRepository(localDataSource);
});

final addTripProvider = Provider<AddTrip>((ref){
  final repository = ref.read(tripRepositoryProvider);
  return AddTrip(repository);
});

final getTripProvider = Provider<GetTrip>((ref){
  final repository = ref.read(tripRepositoryProvider);
  return GetTrip(repository);
});

final deleteTripProvider = Provider<DeleteTrip>((ref){
  final repository = ref.read(tripRepositoryProvider);
  return DeleteTrip(repository);
});

final tripListNotifierProvider = StateNotifierProvider<TripListNotifier, List<Trip>>((ref){
  final getTrips = ref.read(getTripProvider);
  final addTrips = ref.read(addTripProvider);
  final deleteTrips = ref.read(deleteTripProvider);

  return TripListNotifier(getTrips, addTrips, deleteTrips);
});

class TripListNotifier extends StateNotifier<List<Trip>> {
  final GetTrip _getTrip;
  final AddTrip _addTrip;
  final DeleteTrip _deleteTrip;
  TripListNotifier(this._getTrip, this._addTrip, this._deleteTrip) : super([]);

  Future<void> addNewTrip(Trip trip) async {
    await _addTrip(trip);
  }

  Future<void> removeTrip(int tripId) async {
    await _deleteTrip(tripId);
  }

  Future<void> loadTrips() async {
    await _getTrip();
  }

}