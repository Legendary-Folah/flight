import 'package:hotel_ui/features/Trip/Domain/entities/trip.dart';
import 'package:hotel_ui/features/Trip/Domain/repositories/itrip_repository.dart';

class AddTrip {
  final ITripRepository _repository;
  AddTrip(this._repository);

  Future<void> call(Trip trip) async {
    return _repository.addTrip(trip);
  }

}